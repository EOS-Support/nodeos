#!/bin/bash

# Get the latest version of Leap.
latest_tag=$(curl -s https://api.github.com/repos/AntelopeIO/leap/tags | jq -r '.[0].name' | tr -d 'v')

# List available system versions.
echo "Available system versions:"
echo "1. Ubuntu 20.04"
echo "2. Ubuntu 22.04"
echo "3. Ubuntu 18.04"

# Select a system version.
echo "Please select a system version (1-3):"
read -p "> " system_version

# Check if the system version is available.
if [[ $system_version -lt 1 || $system_version -gt 3 ]]; then
  echo "Error: Invalid system version."
  exit 1
fi

# Build the download link.
case "$system_version" in
  1)
    download_url="https://github.com/AntelopeIO/leap/releases/download/v${latest_tag}/leap_${latest_tag}-ubuntu20.04_amd64.deb"
    filename="leap_${latest_tag}-ubuntu20.04_amd64.deb"
    ;;
  2)
    download_url="https://github.com/AntelopeIO/leap/releases/download/v${latest_tag}/leap_${latest_tag}-ubuntu22.04_amd64.deb"
    filename="leap_${latest_tag}-ubuntu22.04_amd64.deb"
    ;;
  3)
    download_url="https://github.com/AntelopeIO/leap/releases/download/v${latest_tag}/leap_${latest_tag}-ubuntu18.04_amd64.deb"
    filename="leap_${latest_tag}-ubuntu18.04_amd64.deb"
    ;;
esac

# Download Leap.
wget $download_url

# Install the downloaded package.
sudo apt install ./$filename

# Print a message when the download is complete.
echo "Downloaded Leap file: $filename"
echo "Leap installed successfully."
