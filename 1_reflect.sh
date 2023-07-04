#!/bin/sh

# Check if the reflector command is installed
if ! command -v reflector > /dev/null; then
    echo "The 'reflector' command is not installed. Installing it now..."
    # install the reflector package
    if [ "$(uname -s)" == "Linux" ]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case "$ID" in
                "arch"|"arcolinux")
                    sudo pacman -S reflector;;
                "ubuntu" | "debian")
                    sudo apt-get install -y reflector;;
                "fedora"|"opensuse"|"rhel")
                    sudo dnf install -y reflector;;
                "linuxmint"|"centos")
                    sudo apt-get install -y reflector;;
                *)
                    echo "Your distribution is not supported."
                    exit 1;;
            esac
        else
            echo "Your system is not supported."
            exit 1
        fi
    else
        echo "Your system is not supported."
        exit 1
    fi
fi

# Update the mirrorlist file with the top 10 mirrors sorted by download rate for the United States and using the https protocol
sudo reflector --verbose --country 'United States' --protocol https --sort rate -n 10 --save /etc/pacman.d/mirrorlist