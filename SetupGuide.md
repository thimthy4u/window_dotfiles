# Setup Guide for Windows Dotfiles & Terminal Customization

Complete setup guide for configuring a modern Windows Terminal and PowerShell environment based on your `window_dotfiles` repository.

---

## Prerequisites & Full Installation Guide

### 1. Install a Nerd Font
Oh My Posh and terminal icons require patched glyphs.
1. Download **Hack Nerd Font** or **JetBrainsMono Nerd Font** from [Nerd Fonts](https://www.nerdfonts.com/).
2. Unzip the file, select all font files, right-click, and select **Install for all users**.

### 2. Set Execution Policy & Install Package Managers
Open **PowerShell** as Administrator or standard user and enable local script execution:

```powershell
# Enable execution policy for local scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Scoop Package Manager
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### 3. Install All Required CLI & App Dependencies
You can use either **winget** or **Scoop** to install all the tools used in this setup:

#### Option A: Using winget (Built-in to Windows 10/11)
```powershell
# Core Shell & Terminal Tools
winget install --id Microsoft.PowerShell --source winget
winget install --id JanDeDobbeleer.OhMyPosh -s winget
winget install --id Git.Git -e --source winget

# Developer CLI Utilities
winget install --id Neovim.Neovim -e --source winget
winget install --id ajeetdsouza.zoxide -e --source winget
winget install --id junegunn.fzf -e --source winget

# Extra External Apps
winget install --id Google.AndroidStudio -e --source winget
```

#### Option B: Using Scoop
```powershell
# Add extra buckets for developer apps
scoop bucket add extras

# Install all CLI utilities & applications
scoop install git neovim oh-my-posh zoxide fzf
```

### 4. Install Required PowerShell Modules
Run the following in PowerShell to install/update the essential modules:

```powershell
# Update PSReadLine to support predictive suggestions
Install-Module -Name PSReadLine -AllowClobber -Force

# Install Git integration and terminal icon glyphs
Install-Module -Name posh-git -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
```

### 5. Clone Your Dotfiles Repository
Clone your repository into your home directory's `.config` path:

```powershell
# Create the target directory
New-Item -Path "$HOME\.config" -ItemType Directory -Force

# Clone dotfiles repo
git clone https://github.com/thimthy4u/window_dotfiles.git "$HOME\.config\powershell"
```

### 6. Configure PowerShell Profile ($PROFILE)
Create and edit your startup profile:

```powershell
if (!(Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
```

Paste the following complete configuration into Notepad and save it:

```powershell
# Set PowerShell encoding to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 1. Modules & Prompt Setup
Import-Module posh-git -ErrorAction SilentlyContinue
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# Modern dynamic Oh My Posh initialization
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    $omp_config = Join-Path "$HOME\.config\powershell" "blueish.omp.json"
    if (Test-Path $omp_config) {
        oh-my-posh init pwsh --config $omp_config | Invoke-Expression
    } else {
        oh-my-posh init pwsh | Invoke-Expression
    }
}

# 2. PSReadLine Configurations & Predictive Suggestions
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionView ListView

# 3. Environment Variables
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# 4. Git Helper Functions
function gpl { git pull @args }
function gtp { git push @args }
function gts { git status @args }
function gta { git add @args }
function gtc { git commit -m "$args" }
function qq  { exit }

# 5. Aliases
Set-Alias -Name vim -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name v   -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name cpl -Value g++ -ErrorAction SilentlyContinue
Set-Alias -Name tt  -Value tree -ErrorAction SilentlyContinue
Set-Alias -Name ll  -Value ls -ErrorAction SilentlyContinue
Set-Alias -Name c   -Value cls -ErrorAction SilentlyContinue
Set-Alias -Name g   -Value git -ErrorAction SilentlyContinue
Set-Alias -Name grep -Value findstr -ErrorAction SilentlyContinue

# External App Aliases
if (Test-Path "C:\Program Files\Android\Android Studio\bin\studio64.exe") {
    Set-Alias -Name android-studio -Value "C:\Program Files\Android\Android Studio\bin\studio64.exe"
}
if (Test-Path "C:\Program Files\Git\usr\bin\tig.exe") {
    Set-Alias -Name tig -Value "C:\Program Files\Git\usr\bin\tig.exe"
}
if (Test-Path "C:\Program Files\Git\usr\bin\less.exe") {
    Set-Alias -Name less -Value "C:\Program Files\Git\usr\bin\less.exe"
}

# 6. Utility Functions
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
```

### 7. Terminal Font & Aesthetics
1. Open **Windows Terminal** -> Press `Ctrl + ,` to open Settings.
2. Under **Profiles**, select **PowerShell** (or **Defaults**).
3. Go to **Appearance** -> Set **Font face** to `"Hack Nerd Font"` or `"JetBrainsMono NF"`.
4. Enable **Transparency / Acrylic effect** if desired.

---

## Helpful Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| **`F2`** | Toggle PSReadLine predictions between single-line inline text and rich **ListView** |
| **`Ctrl + d`** | Delete character under cursor |
| **`Ctrl + r`** | Reverse history search (when using `fzf` / `PSFzf`) |
