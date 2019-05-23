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
       app_sql = docker.build("lucasducau/sql_qqqq:${env.BUILD_ID}","./sql/").run("--name db -v /home/lucas/midatita/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=somewordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress")
       app = docker.build("lucasducau/wordpress_qqqq:${env.BUILD_ID}","./wordpress/").run("-p 9500:80 -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --link db")








    }
try{
    stage('Test wordpress') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */




          sh  'curl http://10.210.8.34:8089/2019/05/23/ | grep LUCASQ && echo "Tests passed." || ( echo "Tests failed." && exit 1 )'


         }
} catch (Exception e){
  app.stop()
  app_sql.stop()
  echo "Tests failed"
  sh 'exit 1'
}
try{
     stage('Push images') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
         withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {

         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
             sh "docker login -u ${USERNAME} -p ${PASSWORD}"
             sh "docker push lucasducau/wordpress_qqqq:${env.BUILD_ID}"
             sh "docker push lucasducau/sql_qqqq:${env.BUILD_ID}"
        /*     app.push("${env.BUILD_ID}")
             app.push("latest")*/
            }
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
  }
  catch (Exception e)
  {
  echo "push failed"
  }

stage('Clean up'){
    app.stop()
    app_sql.stop()

  }
}
