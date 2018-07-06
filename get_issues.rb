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
                   'Example', "#{script_name} [-l] -m \"Milestone name\" | -f \"path to conf.py file\" ")
  opts.separator('')
  opts.on('-m', '--milestone STR', String, "Milestone name" )  { |v| options[:milestone] = v }
  opts.on('-v', '--version STR', String, "Version name" )  { |v| options[:version] = v }
  opts.on('-v', '--release STR', String, "Release name" )  { |v| options[:release] = v }
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
    #puts configs
    options[:version] = configs.scan(/version = '(.*)'/)
    options[:release] = configs.scan(/release = '(.*)'/)
    options[:milestone] = configs.scan(/milestone = '(.*)'/)
    options[:link] = configs.scan(/link = '(.*)'/)
end


begin
    raise "Unknown option(s) #{ARGV.join(', ')}" if ARGV.any?()
    raise "No milestone name defined or found in config file" if !options.key?(:milestone) || options[:milestone].empty?
    raise "No version defined or found in config file" if !options.key?(:version) || options[:version].empty?
    raise "No release name defined or found in config file" if !options.key?(:release) || options[:release].empty?
  rescue Exception => ex
    puts "#{ex.message()}. Please use -h or --h for usage."
    exit(1)
  end

if options.key?(:conf)
    options[:version] = options[:version][0][0]
    options[:release] = options[:release][0][0]
    options[:milestone] = options[:milestone][0][0]
    options[:link] = true if options[:link][0][0] == "true"
end

repository = "one"

milestones_uri = URI("https://api.github.com/repos/OpenNebula/#{repository}/milestones?per_page=200")

@milestones = JSON.parse(Net::HTTP.get(milestones_uri))

milestone_number = get_milestone_number(options[:milestone])

issues_uri = URI("https://api.github.com/repos/OpenNebula/#{repository}/issues?per_page=100&state=closed&milestone=#{milestone_number}")

issues = JSON.parse(Net::HTTP.get(issues_uri))

# open('myfile.out', 'w') { |f|
    puts "Resolved Issues in #{options[:version]}\n"
    puts "--------------------------------------------------------------------------------\n"
    puts "\n"
    puts "The following features has been added in #{options[:version]}\n"
    puts "\n"
    issues.each do |issue|
        if issue["labels"].to_s.include? "Type: Feature"
            if options[:link] == true
                puts "- `#{issue['title']} <#{issue['url']}>`__.\n"
            else
                puts "- #{issue['title']}\n"
            end
        end
    end
    
    puts "\n"
    puts "The following bugs has been solved in #{options[:version]}\n"
    puts "\n"

    issues.each do |issue|
        if issue["labels"].to_s.include? "Type: Bug"
            if options[:link] == true
                puts "- `#{issue['title']} <#{issue['url']}>`__.\n"
            else
                puts "- #{issue['title']}\n"
            end
        end
    end
#   }



#puts issues
#puts issues.length

#issues = JSON.parse(Net::HTTP.get(URI('https://api.github.com/repos/OpenNebula/one/issues?per_page=200&state=all&milestone=9')))