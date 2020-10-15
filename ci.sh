#!/bin/sh

echo "Changing permission of war Files"

sudo chmod +rwx java-components/*.jar

echo "Removing old jars"
sudo rm /home/ec2-user/arnab/*.war
echo "Copied war file"
sudo cp /var/lib/jenkins/workspace/Demo-CI/target/addressbook.war /home/ec2-user/arnab/addressbook.war
echo "Created Docker build addressbookimage"
sudo docker build ./ -t arnab1318/addressbookimage:v1
echo "Push to docker repo"
docker push arnab1318/addressbookimage:v1
echo "---------------------------xxxxxxxxxxxxx--------------------"

