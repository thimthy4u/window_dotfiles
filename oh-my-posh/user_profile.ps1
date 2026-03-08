# $clear = cls
# echo "$clear"
#
# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\blueish.omp.json"

# oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression


Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Load prompt config
# function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
# $PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'blueish.omp.json'
# oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# neofetch

# Alias
function gpl {
  git pull
}

function gtp {
  git push  
}

function gts {
  git status
}

function gtc {
  git commit -m 
}

function qq {
  exit
}

function gta {
  git add 
}

Set-Alias -Name vim -Value nvim
Set-Alias cpl g++
Set-Alias tt tree
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias ll ls
Set-Alias a ls
Set-Alias go cd
Set-Alias back cd
Set-Alias c cls 
Set-Alias codi code-insiders
Set-Alias android-studio "C:\Program Files\Android\Android Studio\bin\studio64.exe"
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'



# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
