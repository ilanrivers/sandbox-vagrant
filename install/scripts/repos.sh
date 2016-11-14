#!/bin/sh
# Install Webtatic repo
echo -e "\nInstalling Webtatic Repository..."
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


# Install EPEL repo
echo -e "\nInstalling Epel Repository..."
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
