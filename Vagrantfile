Vagrant.configure(2) do |config|

 config.vm.define :box1 do |vagrant1|
   vagrant1.vm.box = "ubuntu/xenial64"
   vagrant1.vm.hostname = "box1"
   vagrant1.vm.box_check_update = false
   vagrant1.vm.network "private_network", ip: '10.1.2.3'
   vagrant1.vm.provision "ansible" do |ansible_bootstrap|
     ansible_bootstrap.playbook = "bootstrap.yml"
     ansible_bootstrap.inventory_path = "inventory.ini"
   end
 end

end
