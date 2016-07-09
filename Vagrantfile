###############################################################################################
# Virtual Environment Configuration                                                           #
###############################################################################################

# The URL of the vagrant box
BOX_URL = "https://vagrantcloud.com/chef/centos-6.5/version/1/provider/virtualbox.box"

# Hostname
@HOSTNAME = "VagrantHost"

# Network Type
# Use public network (bridged) to share the same network as the host
# Using "private_network" will require that the guest IP Address is NOT on the
# same network as the host.
@NETWORK_TYPE = "private_network"

# IP Address of Guest
@IP_ADDRESS = "192.168.50.250"

# Memory in Megabytes
@MEMORY = 1024

# CPU's
@CPU = 1

Vagrant.configure("2") do |config|

    config.vm.box = "chef/centos-6.5"
    config.vm.box_url = BOX_URL

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "#{@MEMORY}"]
        vb.customize ["modifyvm", :id, "--cpus", "#{@CPU}"]
        vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--nestedpaging", "on"]

        # Limit the max amount of cpu usage than can be used.
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]

        # Needed when using the box and the openvpn at the same time
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.define "#{@HOSTNAME}" do |box|

        box.vm.network :"#{@NETWORK_TYPE}", ip: @IP_ADDRESS
        box.vm.hostname = @HOSTNAME
        box.vm.synced_folder "~", "/user_home", :mount_options ["ro"]

        box.vm.provision :shell,
            inline: "echo -e \"\n-------------- #{@HOSTNAME} up and running @ #{@IP_ADDRESS} --------------\n\""
    end

    # Do global provisioning
    config.vm.provision :shell,
        path: "install/install.sh"

end

# Local configuration. Can be used to override default settings.
localConfig = 'Vagrantfile.custom'
load localConfig if File.exist?(localConfig)