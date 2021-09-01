export CONTAINER_HOST=ssh://vagrant@127.0.0.1:2222/run/podman/podman.sock
export CONTAINER_SSHKEY=$HOME/.config/podman_files/.vagrant/machines/default/virtualbox/private_key


function pman() {
  if [ $# -lt 1 ]; then
    echo "Nor arguments provided. Usage:\n pman up|down"
    return 1
  fi

  export VAGRANT_CWD=$HOME/.config/podman_files

  case $1 in
    "down")
      echo "shutting down podman"
      vagrant halt
      podman system connection remove vagrant
      ;;
    "up")
      echo "starting podman"
      vagrant up
      podman system connection add vagrant --identity $CONTAINER_SSHKEY $CONTAINER_HOST
      podman system connection default vagrant
      ;;
  esac
}
