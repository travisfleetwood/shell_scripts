#!/bin/bash

# list packages that are no longer required
pacman -Qtdq

# prompt for confirmation before removal
read -p "Are you sure you want to remove the packages listed above? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -R $(pacman -Qtdq)
    echo "Packages removed successfully."
fi