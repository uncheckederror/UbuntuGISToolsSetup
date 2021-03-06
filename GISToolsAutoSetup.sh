#!/bin/bash/
#Configures Ubuntu 16.04 Xenial and installs QGIS and GDAL
#Requires user to be root or run using "sudo bash GISToolsAutoSetup.sh" from Ubuntu's terminal.

#Replaces your existing sources.list with a more permissive version to enhance compatiblity.
curl https://repogen.simplylinux.ch/txt/xenial/sources_8e2c2611bccddbabe97e129f805006bdfd8ee22b.txt | tee /etc/apt/sources.list
echo "" && echo "New the sources.list is installed." && echo ""

#Makes sure the system is all up-to-date with the new sources.list.
apt update && apt upgrade
echo "" && echo "Ready for the new UbuntuGIS repo." && echo ""

#Adds the stable version of the UbuntuGIS repo and checks again for updates.
add-apt-repository ppa:ubuntugis/ppa && apt-get update
echo "" && echo "Ready to install QGIS and GDAL." && echo ""

#Installs QGIS (plus its supporting bits) and GDAL.
apt-get install qgis python-qgis qgis-plugin-grass gdal-bin
echo "" && echo "Cleaning up the system." && echo ""

#Install Ananconda for using Juypter notebooks and GDAL in Python.
cd ~
wget https://repo.continuum.io/archive/Anaconda2-5.0.0.1-Linux-x86_64.sh
bash Anaconda2-5.0.0.1-Linux-x86_64.sh -b -p ~/anaconda
rm Anaconda2-5.0.0.1-Linux-x86_64.sh
echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc
source .bashrc
conda update conda
conda update conda
conda install gdal

#Cleanup the system by checking for updates, upgrading everything, and removing the old packages.
apt update && apt upgrade && apt autoremove
echo "" && echo "QGIS and GDAL are now installed. Happy mapping!" && echo ""




