 pipeline {
  stages{
    stage('test php container'){
      steps{
        sh label: '', returnStatus: true, script: 'cd /var/jenkins_home/tests && ./php_test11.sh'
      }
    }
  }
}

/*
pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                /* `make check` returns non-zero on test failures,
                * using `true` to allow the Pipeline to continue nonetheless
                */
                sh label: '', returnStatus: true, script: 'cd /var/jenkins_home/tests && ./php_test11.sh'
            }
        }
    }
}
*/
