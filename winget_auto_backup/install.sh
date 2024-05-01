#!/bin/bash

# Copy the winget backup script to the user bin directory
cp winget_auto_backup/winget_backup.sh /usr/local/bin/winget_backup.sh

# Make the script executable
chmod +x /usr/local/bin/winget_backup.sh

# Copy the systemd service file to the systemd directory
cp winget_auto_backup/winget_backup.service /etc/systemd/system/winget_backup.service

# Reload the systemd daemon
sudo systemctl daemon-reload

# Enable the service
sudo systemctl enable myservice.service

# Done
echo "winget backup service installed"
echo "To start the service, run 'sudo systemctl start winget_backup.service'"
