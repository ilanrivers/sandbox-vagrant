# Install Samba
if [ ! -d "/etc/samba" ]; then
    echo -e "\nInstalling SAMBA"
    yum -y -q install samba
    cp ${VAGRANT_INSTALL_ROOT}/templates/samba/smb.conf /etc/samba/smb.conf
    echo -e "vagrant\nvagrant" | smbpasswd -s -a vagrant
    chkconfig smb on
fi

# Restart SAMBA
systemctl start smb.service
