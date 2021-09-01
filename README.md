# Podman vagrant configuration

This is a podman + vagrant configuration for OSX that aims to replace docker for
Mac. Installation is super straight forward.

Simply clone this repository to the ".config" folder on your local machine and
run the install script to get started.

```
mkdir -p ~/.config
git clone https://git.hendrikpeter.net/hendrikpeter/osx-podfiles.git ~/.config/podman_files
cd ~/.config/podman_files/
./install.sh
```

Follow the instructions during installation and don't forget to copy the
source-link to your `.zshrc` or `.bash_profile` as described in the installation
success messages.

Common problems can be found in the trouble shooting guide near the end of the
terminal output. Feel free to open a ticket here if you run into other issues
