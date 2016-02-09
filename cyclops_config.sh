#!/bin/bash
echo "-> Cyclops Configuration"
if [ "$1" == "" ]; then
   echo "An argument is required"
   exit 1
else
   myip=$1
   echo $myip
fi

echo "-> Cyclops-udr configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-udr/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086

echo "-> Cyclops-rc configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-rc/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086

echo "-> Cyclops-billing configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-billing/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086
sudo python string_substitution.py /home/ubuntu/cyclops-udr/install/openstack/config/config.js url: ' "http://10.20.30.40:8086/db/udr_service",'

echo "-> Finish setting up Cyclops!"

