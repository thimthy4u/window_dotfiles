Import-Module -Name Terminal-Icons
. $env:USERPROFILE\.config\powershell\user_profile.ps1

$currentUser = git config user.name
$currentProfile = Get-Content "$HOME\.ssh\profile.txt"
echo "Git username: $currentUser"
echo "---------------"
echo "Using SSH Profile: $currentProfile"
function g-profile {
    # Define the path to the github_profile directory
    $sourcePath = "$HOME\.ssh\github_profile"
    # Get the list of folders in the github_profile directory
    $folders = Get-ChildItem -Path $sourcePath -Directory | Select-Object -ExpandProperty Name
    # Display the list and let the user select a folder
    for ($i = 0; $i -lt $folders.Count; $i++) {
        Write-Host "$($i + 1): $($folders[$i])"
    }
    $selection = Read-Host "Select a profile by number"
    $selectedFolder = $folders[$selection - 1]
    # Define the files to copy
    $filesToCopy = @("id_rsa", "id_rsa.pub", "profile.txt")
    # Copy the files from the selected folder to $HOME\.ssh
    foreach ($file in $filesToCopy) {
        $sourceFile = Join-Path -Path "$sourcePath\$selectedFolder" -ChildPath $file
        $destinationFile = Join-Path -Path "$HOME\.ssh" -ChildPath $file
        if (Test-Path $sourceFile) {
            Copy-Item -Path $sourceFile -Destination $destinationFile -Force
            Write-Host "Copied $file to $HOME\.ssh"
        } else {
            Write-Host "Warning: $file not found in $selectedFolder"
        }
    }
}

$phpVersionsPath = "C:\laragon\bin\php\php-8.1.10-Win32-vs16-x64"

function Set-PHPVersion {
    param([string]$version)
    $phpPath = Join-Path $phpVersionsPath $version
    $env:PATH = "$phpPath;{0}" -f $env:PATH
    $output = Invoke-Expression 'php -v'
    Write-Output $output
}
