node ('docker-agent') {
    def app
    def app_sql


    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        git(
        branch: 'master',
        url: 'https://github.globant.com/lucas-ducau/DevOps-Academy.git',
        credentialsId: 'github-globant')
    }

    stage('Build and test images') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
       pushapp = docker.build("lucasducau/wordpress_qqqq:${env.BUILD_ID}","./wordpress/")
       app = docker.build("lucasducau/wordpress_qqqq:${env.BUILD_ID}","./wordpress/").run("-p 9500:80")





       app_sql = docker.build("lucasducau/sql_qqqq:${env.BUILD_ID}","./sql")


    }

    stage('Test wordpress') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */




            sh  'curl http://10.210.8.34:9500/ && echo "Tests passed." || ( echo "Tests failed." && exit 1 )'


         }

    stage('Push images') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
             app.push("${env.BUILD_NUMBER}")
           }

      /*  docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            pushapp.push("${env.BUILD_NUMBER}")
            pushapp.push("latest")
            }
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app_sql.push("${env.BUILD_NUMBER}")
            app_sql.push("latest")
   sh "docker push lucasducau/wordpress_qqqq:${env.BUILD_NUMBER}"
    } */
}
stage('Clean up'){
    sh 'docker rm -f lucasducau/wordpress_qqqq:${env.BUILD_ID}'
    sh 'docker rm -f lucasducau/sql_qqqq:${env.BUILD_ID}'
  }
}
