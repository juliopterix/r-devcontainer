#!/bin/sh
set -e  # Exit immediately if a command exits with a non-zero status

# Download the .deb file
sudo wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the .deb file
sudo dpkg -i google-chrome-stable_current_amd64.deb