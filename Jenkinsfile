 pipeline {
  stages{
    stage('test php container'){
      steps{
        sh label: '', returnStatus: true, script: 'cd /var/jenkins_home/tests && ./php_test11.sh'
      }
    }
  }
}
