# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install software
cinst bat everything firefox fzf 7zip git neovim neovide powershell-core ripgrep microsoft-windows-terminal expressvpn discord deluge eraser spotify vlc firacode nodejs audacity gimp ffmpeg signal
