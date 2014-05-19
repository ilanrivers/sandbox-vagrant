WWW_DOCUMENT_ROOT=/var/www/html
WWW_DIR="$VAGRANT_HOME_DIR/html"

if [ ! -d "$WWW_DIR" ] ; then

    # Install APACHE
    echo -e "\nInstalling Apache..."
    yum -y -q install httpd httpd-tools

    # Configure Apache
    cp ${VAGRANT_INSTALL_ROOT}/templates/apache/default.conf /etc/httpd/conf.d/
    chkconfig httpd on

    # echo "Creating Symlink to DIR : $WWW_DOCUMENT_ROOT"
    ln -s "$WWW_DOCUMENT_ROOT"
    chown -h vagrant:vagrant "$WWW_DIR"

    # Configure developers group
    groupadd developers

    # Vagrant and Apache user are developers
    usermod -a -G developers vagrant
    usermod -a -G developers apache

    # Set permissions on document root
    chgrp developers ${WWW_DOCUMENT_ROOT}
    chmod g+s ${WWW_DOCUMENT_ROOT}
    chmod 775 ${WWW_DOCUMENT_ROOT}
fi