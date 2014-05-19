# Install MySQL
echo -e "\nInstalling MySQL..."
yum -y -q install mysql.`uname -i` yum-plugin-replace
yum -y -q replace mysql --replace-with mysql55w
yum -y -q install mysql55w mysql55w-server
chkconfig mysqld on

# Restart MySQL
service mysqld restart