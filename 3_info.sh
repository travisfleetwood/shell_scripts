#!/bin/sh

# Assign current user's username
user=$(whoami)

# Assign current date
date=$(date)

# Assign current working directory
whereami=$(pwd)

# Assign public IP address
IP=$(curl -s https://checkip.amazonaws.com)

# Find first interface with IP address and assign it to 'ip' variable
ip=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')

# Print user, directory, date, public IP and private IP
echo "You are currently logged in as $user."
echo "You are in the directory $whereami."
echo "Today is: $date"
echo "Your Public Global IP Address is: $IP"
echo "Your Private Local IP Address is: $ip"