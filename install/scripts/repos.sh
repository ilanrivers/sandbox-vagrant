#!/bin/sh
# Install Webtatic repo
echo -e "\nInstalling Webtatic Repository..."
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm

# Install EPEL repo
echo -e "\nInstalling Epel Repository..."
rpm -i http://mirror.karneval.cz/pub/linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
