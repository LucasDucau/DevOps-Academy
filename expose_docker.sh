sudo systemctl stop docker
sudo dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 >> dockerlogs.log 2>&1 &
