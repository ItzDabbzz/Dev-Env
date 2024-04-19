# Terminal And Enviorment Setup

> Install Choco And All Dependencies
```PowerShell
$ Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
$ choco install neovim
$ choco install oh-my-posh
$ choco install fzf
```
> Install Files From Repo

`profile.ps1` > C:\Users\{User}\OneDrive\Documents\PowerShell\profile.ps1

`Neovim` > C:\Users\{user}\AppData\Local\nvim

> Install Powershell 7 & Nerd Font
```PowerShell
$ winget install --id Microsoft.Powershell --source winget
$ winget install ajeetdsouza.zoxide
$ Install-Module posh-git -Scope CurrentUser -Force
$ Install-Module -Name Terminal-Icons -Repository PSGallery -Force
$ Install-Module -Name PSReadLine -AllowPrerelease -Force
```
