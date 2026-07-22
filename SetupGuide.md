Here is a step-by-step walkthrough to set up your Windows Terminal and PowerShell environment using your **`window_dotfiles`** repository based on Takuya Matsuyama's (*Dev as Life*) workflow.

---

### Setup Guide

1. **Install Patched Nerd Fonts:** Required for prompt icons.
Oh My Posh relies on special glyphs and icons that standard Windows fonts don't include.

1. Download a Nerd Font like **Hack Nerd Font** or **JetBrainsMono Nerd Font** from [Nerd Fonts](https://www.nerdfonts.com/).
2. Extract the `.zip` file, select all font files, right-click, and select **Install for all users**.


2. **Install PowerShell 7 & Scoop Package Manager:** 5 min.
Install the modern cross-platform PowerShell 7 and the Scoop package installer:

```powershell
# Install PowerShell 7 via winget
winget install --id Microsoft.PowerShell --source winget

# Enable execution policy for scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

```


3. **Install CLI Tools & Oh My Posh:** Terminal utilities.
Use Scoop to install the essential command-line tools used in the setup:

```powershell
scoop install git neovim oh-my-posh zoxide fzf
scoop bucket add extras

```


4. **Clone Your Dotfiles Repository:** Repository deployment.
Clone your repository into your home directory or `.config` folder:

```powershell
# Create config directory if it doesn't exist
New-Item -Path "$HOME\.config" -ItemType Directory -Force

# Clone your dotfiles repo
git clone https://github.com/thimthy4u/window_dotfiles.git "$HOME\.config\powershell"

```


5. **Configure Your PowerShell Profile ($PROFILE):** Profile activation.
Set up PowerShell to load your `user_profile.ps1` automatically on startup:

1. Check your profile path by running `$PROFILE` in PowerShell.
2. Create or edit your profile file:

```powershell
if (!(Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE

```

3. Add dot-sourcing to load your custom profile from the cloned repo:

```powershell
. "$HOME\.config\powershell\user_profile.ps1"

```

Ensure your `user_profile.ps1` contains your Oh My Posh init command and module imports:

```powershell
# Sample initialization inside user_profile.ps1
oh-my-posh init pwsh --config "$HOME\.config\powershell\theme.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

# Aliases
Set-Alias ll ls
Set-Alias g git
Set-Alias nv nvim

```


6. **Configure Windows Terminal Settings:** Visual tuning.
Open **Windows Terminal** -> Press `Ctrl + ,` -> Click **Open JSON file** (bottom left).

Update your default profile configuration:

* **Font Face:** Set to `"Hack Nerd Font"` or `"JetBrainsMono NF"`.
* **Opacity & Acrylic:** Enable background transparency and acrylic effect.
* **Default Shell:** Point default profile GUID to PowerShell 7.


---

> **Tip:** If script execution errors appear when opening PowerShell, run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser` to allow your custom profile scripts to load smoothly.
