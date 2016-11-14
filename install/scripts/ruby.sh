# Install GIT
echo -e "\nInstalling RVM for Ruby..."

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L get.rvm.io | bash -s stable
source ~/.profile
rvm install 2.3.1

echo -e "\nInstalling Capifony..."
rvm @global do gem install capifony