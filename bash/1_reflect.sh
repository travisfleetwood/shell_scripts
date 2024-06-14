#!/bin/sh

# Function to install reflector if not already installed
install_reflector() {
    if ! command -v reflector &>/dev/null; then
        echo "Reflector not found. Attempting to install..."
        sudo pacman -S --noconfirm reflector || { echo "Failed to install reflector with pacman."; exit 1; }
    else
        echo "Reflector is already installed."
    fi
}

# Function to update mirrorlist with reflector
update_mirrorlist() {
    local country="$1"
    local age="$2"
    local protocol="$3"
    local sort="$4"
    local number="$5"
    local mirrorlist="$6"

    echo "Updating the mirrorlist..."
    sudo reflector --verbose --country "$country" --age "$age" --protocol "$protocol" --sort "$sort" --number "$number" --save "$mirrorlist" || {
        echo "Error: Failed to update mirrorlist with reflector."
        exit 1
    }
}

# Function to handle errors
handle_error() {
    local message="$1"
    echo "Error: $message"
    exit 1
}

# Main function
main() {
    # Parameters
    local country="United States"
    local age="12"
    local protocol="https"
    local sort="rate"
    local number="10"
    local mirrorlist="/etc/pacman.d/mirrorlist"

    # Backup the existing mirrorlist
    echo "Backing up the existing mirrorlist..."
    sudo cp "$mirrorlist" "$mirrorlist.bak" || handle_error "Failed to back up the mirrorlist."

    # Install reflector if not already installed
    install_reflector

    # Update the mirrorlist with reflector
    update_mirrorlist "$country" "$age" "$protocol" "$sort" "$number" "$mirrorlist"

    # Check if mirrorlist update succeeded
    echo "Mirrors have been updated."
}

# Run the main function
main