#/bin/bash

echo "It's important that you install the following tools before you begin:\n - VirtualBox\n - HomeBrew\n"
read -p "Press enter to continue.."

echo "------------------------------------------------------------------------"
echo "Step 1: install Vagrant"
if command -v vagrant &> /dev/null
then
  echo "Vagrant was already installed, please update it manually using\n    brew update vagrant\n"
  read -p "Press enter when updated..."
else
  brew install vagrant
fi

echo "\n------------------------------------------------------------------------"
echo "step 2: install Podman"
if command -v podman &> /dev/null
then
  echo "Podman was already installed, please update it manually using\n    brew update podman\n"
  read -p "Press enter when updated..."
else
  brew install podman
fi

echo "\n------------------------------------------------------------------------"
echo "step 3: loading & starting podman \n"

echo "vagrant and podman have now been installed on your system\nand you are ready to start doing stuff!"
echo "Please add the following line to your $HOME/.zshrc or $HOME/.bash_profile\nbased on what shell you are using\n"
echo "source ~/.config/podman_files/podman_config_sourcable.sh\n"
echo "after reloading the shell you can start and stop the podman VM using\n    pman up|down\n"

echo "\n------------------------------------------------------------------------"
echo "# getting started"
echo "try running the hello-world image:
  podman run hello-world
  "
echo "try running a simple httpd server headless:
  podman run hello-world
  podman run -dt -p 5000:80/tcp docker.io/library/httpd
  [visit localhost:5000 in your browser]
  podman ps
  podman stop [insert first id]
  "

echo "# trouble-shooting common problems:"
echo "- port forwarding errors:\nmodify the pot forwarding for-loop in ~/.config/podman_files/Vagrantfile to not include ports that have been reserved on your system\n"
echo "- error storing credentials:\nplease rename your local ~/.docker folder to ~/.docker-old. the sessions in it are colliding with podmans credential store\n"
echo "- other issues & updates:\ntry removing the vagrant image. using 'cd ~/.config/podman_files' followed by 'vagrant destroy'\n"

echo "\n------------------------------------------------------------------------"
echo "Installation complete. you can re-run this script to see the example commands and trouble shooting guide"
