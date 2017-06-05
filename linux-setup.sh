#!/bin/bash

### Prevent sourcing ###
interpreter_name="$(basename "$SHELL")"
if [[ $0 != $BASH_SOURCE ]]; then
    echo "[setup] Something is wrong with the way this script is being run."
    echo "[setup] Perhaps you sourced it instead of running it as an executable."
    echo "[setup] Or your system's version of bash could be too old."
    bash --version
    return 1 2>/dev/null || exit 1
fi

### Script environment ###
set -e
set -o pipefail
cd "$(dirname "$0")"

### Error handling ###

handle_error() {
    set +e
    set +o pipefail
    echo
    echo "[setup] It looks like an error occurred. Please try to fix it, and then run this script again."
}

trap handle_error EXIT

### Main Setup ###
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y update
sudo apt-get -y install software-properties-common

#install wget#
sudo apt-get -y install wget

#install git#
sudo apt-get -y install git

#install java#
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo sh -c "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
sudo apt-get -y install oracle-java8-installer

#install zsh#
sudo apt-get -y install zsh
ln -s $PWD/linux-zshrc ~/.zshrc

# TODO: handle doing this shell switch automatically
# TODO: add zplug
chsh -s $(which zsh)

#install tmux#
sudo apt-get -y install tmux
ln -s $PWD/.tmux.conf ~/.tmux.conf

#install lein#
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo mv lein /bin
sudo chmod a+x /bin/lein

#install ag#
sudo apt-get -y install silversearcher-ag

#install xclip#
sudo apt-get -y install xclip

#install emacs*
sudo apt-get -y install emacs
mkdir -p ~/.emacs.d
ln -s $PWD/radian-emacs ~/.emacs.d/radian
ln -s $PWD/init.el ~/.emacs.d/init.el
ln -s $PWD/init.before.local.el ~/.emacs.d/init.before.local.el
ln -s $PWD/init.local.el ~/.emacs.d/init.local.el

### Cleanup ###
trap EXIT
set +e
set +o pipefail
