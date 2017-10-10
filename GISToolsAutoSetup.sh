#!/bin/bash/
#Configures Ubuntu 16.04 Xenial and installs QGIS and GDAL.

#Replaces your existing sources.list with a more permissive version to enhance compatiblity.
curl https://repogen.simplylinux.ch/txt/xenial/sources_8e2c2611bccddbabe97e129f805006bdfd8ee22b.txt | sudo tee /etc/apt/sources.list
echo "" && echo "New the sources.list is installed." && echo ""

#Makes sure the system is all up-to-date with the new sources.list.
sudo apt update && sudo apt upgrade
echo "" && echo "Ready for the new UbuntuGIS repo." && echo ""

#Adds the stable version of the UbuntuGIS repo and checks again for updates.
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
echo "" && echo "Ready to install QGIS and GDAL." && echo ""

#Installs QGIS (plus its supporting bits) and GDAL.
sudo apt-get install qgis python-qgis qgis-plugin-grass gdal-bin
echo "" && echo "Cleaning up the system." && echo ""

#Cleanup the system by checking for updates, upgrading everything, and removing the old packages.
sudo apt update && sudo apt upgrade && sudo apt autoremove
echo "" && echo "QGIS and GDAL are now installed. Happy mapping!" && echo ""