node {
    environment {
        VERSION = sh 'echo $GIT_BRANCH | cut -d "-" -f 2'
    }
    stage {
        checkout scm
        sh 'printenv'
        make html
        sh 'rsync -avP -e "ssh -i /home/test/id_rsa" ./build/html/ root@10.10.0.53:/var/www/html/$version'
    }
}