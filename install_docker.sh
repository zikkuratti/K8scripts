#!/bin/bash

# Update the package index
sudo apt-get update

# Install necessary packages
sudo apt-get install -y ca-certificates curl gnupg

# Create a directory for the keyrings
sudo install -m 0755 -d /etc/apt/keyrings

# Download and store Docker's GPG key in the keyring directory
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Change permissions of the GPG key file
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
