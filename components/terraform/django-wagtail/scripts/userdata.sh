#!/bin/bash

sudo touch /var/log/start-up.log

echo "$(date '+%Y-%m-%d %T') - system update" | sudo tee -a /var/log/start-up.log > /dev/nullsudo dnf -y update

echo "$(date '+%Y-%m-%d %T') - install EFS utilities" | sudo tee -a /var/log/start-up.log > /dev/null
sudo dnf install -y amazon-efs-utils

# mounting process for ebs
echo "$(date '+%Y-%m-%d %T') - check if media directory exist" | sudo tee -a /var/log/start-up.log > /dev/null
BASE_DIR="$${mount_dir}"
if [ ! -d "$BASE_DIR" ]; then
  echo "$(date '+%Y-%m-%d %T') - create media directory" | sudo tee -a /var/log/start-up.log > /dev/null
  sudo mkdir $BASE_DIR
  sudo chown -R postgres:postgres $BASE_DIR
else
  echo "$(date '+%Y-%m-%d %T') - media directory found" | sudo tee -a /var/log/start-up.log > /dev/null
fi

# Mount EFS storage
echo "$(date '+%Y-%m-%d %T') - check if EFS is mounted" | sudo tee -a /var/log/start-up.log > /dev/null
mounted=$(df -h --type=nfs4 | grep $BASE_DIR)
if [ -z "$${mounted}" ]; then
  echo "$(date '+%Y-%m-%d %T') - set up system for persistent mounting of EBS" | sudo tee -a /var/log/start-up.log > /dev/null
  sudo echo "${mount_target}:/ ${mount_dir} nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,fsc,_netdev 0 0" >> /etc/fstab
  echo "$(date '+%Y-%m-%d %T') - mount of EBS" | sudo tee -a /var/log/start-up.log > /dev/null
  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${mount_target}:/ ${mount_dir}
else
  echo "$(date '+%Y-%m-%d %T') - EBS found)" | sudo tee -a /var/log/start-up.log > /dev/null
fi





# Auto mount EFS storage on reboot

sudo systemctl restart httpd

# Install CodeDeploy Agent
#sudo yum update
#sudo yum install ruby -y
#sudo yum install wget -y
#CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
#$CODEDEPLOY_BIN stop
#sudo yum erase codedeploy-agent -y
#sudo wget https://aws-codedeploy-eu-west-2.s3.eu-west-2.amazonaws.com/latest/install
#sudo chmod +x ./install
#sudo ./install auto

docker inspect --format='{{range $key, $value := .NetworkSettings.Networks}}{{if eq $key "'"traefik_webgateway"'"}}{{$value.IPAddress}}{{end}}{{end}}' "blue-dw"
