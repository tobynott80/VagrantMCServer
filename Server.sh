#!/bin/bash

echo "whoami..."
whoami

echo "pwd..."
pwd

echo "YUM: upgrading"
sudo yum upgrade -y

echo "YUM: install jkd17"
sudo yum install java-17-openjdk-devel -y

echo "YUM: Install GIT"
sudo yum install git


echo "creating a directory for the server"
mkdir mc
cd mc

echo "Getting latest server from mc.com"
curl https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar -o server.jar

echo "creating eula"
touch eula.txt
echo eula=true >> eula.txt

echo "Creating startup script"
touch startup.sh
sudo chmod +x startup.sh
echo '#!/bin/bash' >> startup.sh
echo 'sudo java -Xmx1024M -Xms1024M -jar server.jar nogui' >> startup.sh

