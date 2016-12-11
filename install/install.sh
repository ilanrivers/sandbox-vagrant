#!/usr/bin/env bash
echo -e "\n\n******* Starting to install Development Box Modules ( Might take a few minutes ) *******"

export VAGRANT_ROOT=/vagrant
export VAGRANT_HOME_DIR=/home/vagrant
export VAGRANT_CACHE=$VAGRANT_ROOT/cache
export VAGRANT_INSTALL_ROOT=$VAGRANT_ROOT/install

# CouchBase Vars
export COUCHBASE_SERVER='/etc/init.d/couchbase-server'
export COUCHBASE_TEMPLATES="$VAGRANT_INSTALL_ROOT/templates/couchbase"

export HTTP_SERVER='/etc/init.d/httpd'
export SAMBA_SERVER='/etc/init.d/smb'

# Create cache
if [ ! -d "$VAGRANT_CACHE" ]; then
    echo "Creating cache dir [$VAGRANT_CACHE]..."
    mkdir "$VAGRANT_CACHE"
fi

# Install Extra Repos
sh ${VAGRANT_INSTALL_ROOT}/scripts/repos.sh

# Install Git
sh ${VAGRANT_INSTALL_ROOT}/scripts/git.sh

# Install MySQL
sh ${VAGRANT_INSTALL_ROOT}/scripts/mysql.sh

# Install Apache (http)
sh ${VAGRANT_INSTALL_ROOT}/scripts/apache.sh

# Install PHP
sh ${VAGRANT_INSTALL_ROOT}/scripts/php.sh

# Install SAMBA
sh ${VAGRANT_INSTALL_ROOT}/scripts/samba.sh

# Install Couchbase
# sh ${VAGRANT_INSTALL_ROOT}/scripts/couchbase.sh

# Install Couchbase PHP extension
# sh ${VAGRANT_INSTALL_ROOT}/scripts/couchbase_php.sh

# Update all packages
echo -e "\nUpdating all packages..."
#yum -y -q update

# Restart Apache
systemctl start httpd.service
