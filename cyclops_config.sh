#!/bin/bash
echo "-> Cyclops Configuration"

myip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo "-> Cyclops-udr configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-udr/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086

echo "-> Cyclops-rc configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-rc/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086

echo "-> Cyclops-billing configuration file"
sudo python string_substitution.py /home/ubuntu/cyclops-billing/src/main/webapp/WEB-INF/configuration.txt InfluxDBURL= http://$myip:8086
sudo python string_substitution.py /home/ubuntu/cyclops-udr/install/openstack/config/config.js url: ' "http://10.20.30.40:8086/db/udr_service",'

echo "-> Finish setting up Cyclops!"

