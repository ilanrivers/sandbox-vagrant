###############################################################################################
# Virtual Environment Configuration                                                           #
###############################################################################################

# The URL of the vagrant box
BOX_URL = "https://vagrantcloud.com/chef/centos-6.5/version/1/provider/virtualbox.box"

@HOSTNAME = "DevBox"
@IP_ADDRESS = "192.168.50.250"

Vagrant.configure("2") do |config|

    config.vm.box = "chef/centos-6.5"
    config.vm.box_url = BOX_URL
  
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--nestedpaging", "on"]
        
        # Limit the max amount of cpu usage than can be used.
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
        
        # Needed when using the box and the openvpn at the same time
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.define "#{@HOSTNAME}" do |hnn|

        hnn.vm.network :private_network, ip: @IP_ADDRESS
        hnn.vm.hostname = @HOSTNAME
        hnn.vm.synced_folder "~", "/user_home", :mount_options ["ro"]
            
        hnn.vm.provision :shell,
            inline: "echo -e \"\n-------------- #{@HOSTNAME} up and running @ #{@IP_ADDRESS} --------------\n\""
    end

    # Do global provisioning
    config.vm.provision :shell,
        path: "install/install.sh"
        
end

# Local configuration. Can be used to override default settings.
localConfig = 'Vagrantfile.custom'
load localConfig if File.exist?(localConfig)