#!/bin/bash

# Update system and install core packages
echo "======================================="
echo " Updating package list"
echo "======================================="
sudo apt update

echo "======================================="
echo " Installing Java 21"
echo "======================================="
sudo apt install fontconfig openjdk-21-jre

echo "======================================="
echo " Checking Java version"
echo "======================================="
java -version

echo "======================================="
echo " Downloading Jenkins key"
echo "======================================="
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "======================================="
echo " Adding Jenkins repository"
echo "======================================="
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

echo "======================================="
echo " Updating package list again"
echo "======================================="
sudo apt update

echo "======================================="
echo " Installing Jenkins"
echo "======================================="
sudo apt install jenkins

echo "============================================"
echo " Starting Jenkins service..."
echo "============================================"
sudo systemctl start jenkins

echo "============================================"
echo " Enabling Jenkins on boot..."
echo "============================================"
sudo systemctl enable jenkins

echo "============================================"
echo " Checking Jenkins service status..."
echo "============================================"
sudo systemctl status jenkins --no-pager

echo "======================================="
echo " Jenkins Initial Admin Password"
echo "======================================="

# Docker installation
sudo apt-get update
sudo apt-get install docker.io -y

# User group permission
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins

sudo systemctl restart docker
sudo systemctl restart jenkins

echo "=========================================="
echo "Starting Trivy Installation"
echo "=========================================="

echo "[1/5] Installing required dependencies..."
sudo apt-get install wget gnupg
echo "✓ Dependencies installed successfully."

echo "[2/5] Adding Trivy GPG key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "✓ Trivy GPG key added successfully."

echo "[3/5] Adding Trivy repository..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
echo "✓ Trivy repository added successfully."

echo "[4/5] Updating package index..."
sudo apt-get update
echo "✓ Package index updated successfully."

echo "[5/5] Installing Trivy..."
sudo apt-get install trivy
echo "✓ Trivy installed successfully."

echo "=========================================="
echo "Trivy Installation Completed"
echo "=========================================="

echo "Installed Version:"

# AWS CLI installation
sudo snap install aws-cli --classic

# Helm installation
sudo snap install helm --classic