node {
    stage('Fetch from Github') {
        checkout scm
        sh 'printenv'       
        sh 'echo $BRANCH_NAME'
        sh 'echo `echo $BRANCH_NAME | cut -d "-" -f 2`'
    }
    stage('Build HTML') {
        sh 'make html'
    }
//    stage('Build PDF') {
//    }
    stage('Publish HTML') {
        sh 'rsync -avP -e "ssh -i /home/test/id_rsa" ./build/html/ root@10.10.0.53:/var/www/html/`echo $BRANCH_NAME | cut -d "-" -f 2`'
    }
}