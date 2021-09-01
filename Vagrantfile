Vagrant.configure("2") do |config|
  config.vm.box = "fedora/34-cloud-base"
  config.vm.box_version = "34.20210423.0"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  # This port is used by podman to connect to the podman daemon
  # You should not have to modify this. If a reserved port shows up,
  # then destroy the vagrant instance and open the virtualbox app to see if nothing is running
  config.vm.network "forwarded_port", guest: 22, host: 2222

  # Modify this for loop if you experience colliding ports on your network
  for i in 5000..5100
    config.vm.network "forwarded_port", guest: i, host: i
  end

  config.vm.hostname = "vagrant.local"

  config.vm.provision "shell", inline: <<-SHELL
    yum install -y podman libvarlink-util libvarlink chrony --enablerepo=updates-testing --refresh

    groupadd -f -r podman

    #systemctl edit podman.socket
    mkdir -p /etc/systemd/system/podman.socket.d
    cat >/etc/systemd/system/podman.socket.d/override.conf <<EOF
[Socket]
SocketMode=0660
SocketUser=root
SocketGroup=podman
EOF
    systemctl daemon-reload
    echo "d /run/podman 0770 root podman" > /etc/tmpfiles.d/podman.conf
    sudo systemd-tmpfiles --create

    systemctl enable podman.socket
    systemctl start podman.socket
    systemctl enable --now chronyd

    usermod -aG podman $SUDO_USER
  SHELL
end
