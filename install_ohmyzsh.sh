#/bin/bash

# OS_WHICH=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
OS_WHICH=$(. /etc/os-release; echo "$NAME")
OS_CENTOS="CentOS Linux"
OS_UBUNTU="Ubuntu"

function install_zsh_centos { 
    sudo yum install zsh -y
}
function install_zsh_ubuntu { 
    sudo apt install zsh -y
}

if [[ $OS_WHICH = $OS_CENTOS ]]; then
    echo "You are on $OS_CENTOS"
    install_zsh_centos
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "You are on $OS_UBUNTU"
    install_zsh_ubuntu
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi