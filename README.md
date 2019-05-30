# DevOps-Academy
DevOps Academy May 2019

Week 1 - DevOps culture and methodology: https://docs.google.com/presentation/d/1zVJNZ3HgBLEi2C6yUY_vBhl9whw0D7huRZxXIPATERY/edit?usp=sharing


## How to run this project:

- Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) (or any other virtualization software).
- Clone this project and cd into it, then run ```vagrant up```
- Then, run ```vagrant ssh``` and ```docker ps```, you should see 4 containers running.
- After that, run ```sudo chown -R 1000 /jenkins_home``` then ```cd /vagrant``` and finally ```docker-compose up --build -d```
- Now 5 containers should be running.
- Run ```ifconfig``` to see your VM's ip, usually located here:

![ipimg](https://i.imgur.com/VXvlZ1N.png)

- Then go to YOURIP:8050, you should see the Jenkins splash screen.
- Install all suggested plugins, and login.
- Go to ```Manage Jenkins``` -> ```Manage Plugins``` -> ```Available``` and search for Docker, then install this plugin:

![dockerplugin](https://i.imgur.com/telyLWy.png)

- After it's installed, go to ```Manage Jenkins``` -> ```Configure System```
- At the bottom of the screen, click on ```Add a new cloud``` -> ```Docker```, then click on ```Docker Cloud details```
- On ```Docker Host URI``` type ```tcp://YOURIP:2375/``` and tick the ```Enabled``` box, then click ```Test Connection```
- You should see the Docker version and it's API version.
- If this doesn't work try running the ```expose_docker.sh``` script manually.
- Now click on ```Docker Agent templates```
- On ```Labels``` type ```docker-agent```, then tick the ```Enabled``` box
- On ```Docker Image``` type ```benhall/dind-jenkins-agent:v2```
- On ```Connect method``` select ```Connect with SSH```
- Then go to ```Container Settings```
- On ```Volumes```, type ```/var/run/docker.sock:/var/run/docker.sock```, and on a new line ```/home/lucas/midatita/:/home/lucas/midatita``` 
- Docker should be correctly configured, now go to ```Credentials``` -> ```global``` -> ```Add credentials``` at the top left.
- Add your github and dockerhub credentials. For them to be recognized by the pipeline, their respective IDs should be ```github-globant``` and ```docker-hub-credentials```
- Now go to ```New Item``` and create a ```Pipeline``` project.
- Go to ```Configure``` -> ```Pipeline``` and follow the instructions on the image below:

![pipelineconfig](https://i.imgur.com/YhXu9f3.png)

- Build the project, everything should work.










# NOTES:

- The step where I suggest to ```sudo chown -R 1000 /jenkins_home``` can be avoided with better system provisioning but for some reason I could never make it work properly so I used this workaround. 
- The Wordpress Jenkinsfile is configured to search for some persistent data I typed into my Wordpress container, if you run the project for the first time you will encounter an error.
- To avoid this you will need to manually run the Wordpress and SQL containers, install it for the first time, and then type some random data into it, then modify the Jenkinsfile to look for it.

For any questions or suggestions, I can be reached at: lucas.ducau@globant.com
