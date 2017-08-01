Vagrant.configure(2) do |config|

config.vm.provider "virtualbox" do |v|
  v.memory = 4096
  v.cpus = 4
end

 config.vm.define :box1 do |vagrant1|
   vagrant1.vm.box = "ubuntu/xenial64"
   vagrant1.vm.hostname = "box1"
   vagrant1.vm.box_check_update = false
   vagrant1.vm.network "private_network", ip: '10.1.2.3'
   vagrant1.vm.provision "ansible" do |ansible_bootstrap|
     ansible_bootstrap.playbook = "bootstrap.yml"
     ansible_bootstrap.inventory_path = "inventory.ini"
   end

   vagrant1.vm.provision "file", source: "build_docker.sh", destination: "/home/ubuntu/build_docker.sh"
   vagrant1.vm.provision "file", source: "Dockerfile", destination: "/home/ubuntu/Dockerfile"
   vagrant1.vm.provision "shell", inline: "/bin/bash /tmp/build_docker.sh"
 end

end
