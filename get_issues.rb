#!/usr/bin/ruby

require 'net/http'
require 'json'
require 'optparse'

def get_milestone_number(title)
    @milestones.each do |milestone|
        if milestone["title"] == title
        return milestone["number"]
        end
    end
end

options = {}
ARGV.options do |opts|
  script_name = File.basename($0)
  opts.banner = 'Recover github issues from milestone'
  opts.define_head("Usage: #{script_name} [OPTIONS]",
                   'Example', "#{script_name} [-l] -m \"Milestone name\" -r project_repo -v release_version | -f \"path to conf.py file\" ")
  opts.separator('')
  opts.on('-m', '--milestone STR', String, "Milestone name" )  { |v| options[:milestone] = v }
  opts.on('-r', '--repo STR', String, "Repository" )  { |v| options[:repo] = v }
  opts.on('-v', '--release STR', String, "Release name" )  { |v| options[:release] = v }
  opts.on('-t', '--token STR', String, "Access Token [Optional]" )  { |v| options[:release] = v }
  opts.on('-f', '--config-file STR', String, "Path to conf.py" )  { |v| options[:conf] = v }
  opts.on("-l", "--link", "Set reference link to github") do |v|
    options[:link] = v
  end
  opts.separator('')
  opts.on_tail('-h', '--help', 'Show this help message.') do
    puts(opts)
    exit(0)
  end
  opts.parse!()
end

if options.key?(:conf)
    configs = File.read(options[:conf])
    options[:repo] = configs.scan(/repo = '(.*)'/)
    options[:release] = configs.scan(/release = '(.*)'/)
    options[:milestone] = configs.scan(/milestone = '(.*)'/)
    options[:link] = configs.scan(/link = '(.*)'/)
    options[:token] = configs.scan(/access_token = '(.*)'/)
end


begin
    raise "Unknown option(s) #{ARGV.join(', ')}" if ARGV.any?()
    raise "No milestone name defined or found in config file" if !options.key?(:milestone) || options[:milestone].empty?
    raise "No version defined or found in config file" if !options.key?(:repo) || options[:repo].empty?
    raise "No release name defined or found in config file" if !options.key?(:release) || options[:release].empty?
  rescue Exception => ex
    puts "#{ex.message()}. Please use -h or --h for usage."
    exit(1)
  end

if options.key?(:conf)
    options[:repo] = options[:repo][0][0]
    options[:release] = options[:release][0][0]
    options[:milestone] = options[:milestone][0][0]
    options[:token] = options[:token][0][0]
    options[:link] = true if options[:link][0][0] == "true"
end

if options[:token].empty?
    milestones_uri = URI("https://api.github.com/repos/OpenNebula/#{options[:repo]}/milestones?per_page=100")
else
    milestones_uri = URI("https://api.github.com/repos/OpenNebula/#{options[:repo]}/milestones?per_page=100&access_token=#{options[:token]}")
end
puts "token = #{options[:token]}"
    puts "empty" if options[:token].empty?

puts "milest uri = #{milestones_uri}"
@milestones = JSON.parse(Net::HTTP.get(milestones_uri))
milestone_number = get_milestone_number(options[:milestone])
if options[:token].empty?
    issues_uri = URI("https://api.github.com/repos/OpenNebula/#{options[:repo]}/issues?per_page=100&state=closed&milestone=#{milestone_number}")
else
    issues_uri = URI("https://api.github.com/repos/OpenNebula/#{options[:repo]}/issues?per_page=100&state=closed&milestone=#{milestone_number}&access_token=#{options[:token]}")
end
issues = JSON.parse(Net::HTTP.get(issues_uri))
if !issues.is_a?(Array)
    puts "Error on HTTP request"
    puts issues
    exit -1
end

puts "Resolved Issues in #{options[:release]}\n"
puts "--------------------------------------------------------------------------------\n"
puts "\n"

if issues.empty?
    puts "No new features or corrected bugs were found on this release"
else 
    puts "The following features have been added in #{options[:release]}\n"
    puts "\n"
    issues.each do |issue|
        if issue["labels"].to_s.include? "Type: Feature"
            if options[:link] == true
                puts "- `#{issue['title'].tr('`','')} <#{issue['html_url']}>`__.\n"
            else
                puts "- #{issue['title']}\n"
            end
        end
    end
    puts "\n"
    puts "The following bugs has been solved in #{options[:release]}\n"
    puts "\n"

    issues.each do |issue|
        if issue["labels"].to_s.include? "Type: Bug"
            if options[:link] == true
                puts "- `#{issue['title'].tr('`','')} <#{issue['html_url']}>`__.\n"
            else
                puts "- #{issue['title']}\n"
            end
        end
    end
end
