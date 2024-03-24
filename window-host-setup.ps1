# Check if the script is running with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator."
    Exit
}

# Install winget
try {
    Write-Host "Installing winget..."
    Add-AppxPackage https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
} catch {
    Write-Host "Failed to install winget."
    Exit
}

# Install winget packages
try {
    Write-Host "Installing winget packages..."
    winget import -i winget-packages.json
} catch {
    Write-Host "Failed to install winget packages."
    Exit
}

# Apply terminal settings
# try {
#     $sourceFilePath = ".\terminal-settings.json"  # Specify the path to your settings file
#     $destinationFolderPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
#     $destinationFilePath = Join-Path -Path $destinationFolderPath -ChildPath "settings.json"

#     # Copy your settings file to the destination folder
#     Copy-Item -Path $sourceFilePath -Destination $destinationFolderPath -Force

#     # Rename the copied file to settings.json if needed
#     Rename-Item -Path (Join-Path -Path $destinationFolderPath -ChildPath "settings.json") -NewName "settings-backup.json"

#     # Rename your file to settings.json if needed
#     Rename-Item -Path $sourceFilePath -NewName "settings.json"
# } catch {
#     Write-Host "Failed to apply terminal settings."
#     Exit
# }


# Install wsl
try {
    Write-Host "Installing WSL..."
    wsl --install -d Ubuntu-22.04
} catch {
    Write-Host "Failed to install WSL."
    Exit
}


Write-Host "Installation complete."