#!/bin/sh

# This script updates and upgrades all packages installed via the opam package manager.
# It updates the list of available packages and versions using the "opam update" command, and then upgrades the installed packages to the latest version available using the "opam upgrade" command.
# Use with caution as the -y flag will automatically confirm any prompts during the update or upgrade process.
opam update -y && opam upgrade -y