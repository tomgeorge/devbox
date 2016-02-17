# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #    vb.gui = true
   end
  config.vm.hostname "devbox"

   # install stuff

   # Stuff that ends in || true could possibly fail silently.  Don't forget to check when debugging.
  

   
   # install some utilities
   config.vm.provision "shell", path: "sh/install-utilities.sh"
   
   # set up my dotfiles
   config.vm.provision "shell", path: "sh/set-up-dotfiles.sh"

   # install oh-my-zsh
   config.vm.provision "shell", path: "sh/install-oh-my-zsh.sh"
	
   # install docker
   config.vm.provision "docker"
   # create docker group
   config.vm.provision "shell", inline: "sudo gpasswd -a vagrant docker"
   config.ssh.forward_agent = true

   config.vm.network "private_network", ip: "192.168.0.10", netmask: "255.255.0.0"
   config.vm.provider :virtualbox do |vb|
	  vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
	end

   # forward port 8080
   config.vm.network "forwarded_port", guest: 8080, host: 8080 
   config.vm.network "forwarded_port", guest: 80, host: 80 
   config.vm.network "forwarded_port", guest: 8083, host: 8083
   config.vm.network "forwarded_port", guest: 8086, host: 8086
   config.vm.network "forwarded_port", guest: 9000, host: 9000

   # install docker compose, and docker completion 
   config.vm.provision "shell", path: "sh/install-docker-compose.sh"

   # configure vim
   config.vm.provision "shell", path: "sh/configure-vim.sh"

   config.vm.synced_folder "~/git", "/home/vagrant/git"
end
