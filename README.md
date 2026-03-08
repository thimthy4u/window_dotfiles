# Windows Dotfiles

This repository contains the personal PowerShell configuration and Oh My Posh themes used on Windows.

## Files

- [oh-my-posh/blueish.omp.json](oh-my-posh/blueish.omp.json) — Oh My Posh theme (blueish)
- [oh-my-posh/clean-detailed.omp.json](oh-my-posh/clean-detailed.omp.json) — Oh My Posh theme (clean-detailed)
- [oh-my-posh/takuya.omp.json](oh-my-posh/takuya.omp.json) — Oh My Posh theme (takuya)
- [oh-my-posh/user_profile.ps1](oh-my-posh/user_profile.ps1) — Main PowerShell helper functions and aliases (defines [`$omp_config`](oh-my-posh/user_profile.ps1) and helpers like [`gpl`](oh-my-posh/user_profile.ps1), [`gtp`](oh-my-posh/user_profile.ps1), [`which`](oh-my-posh/user_profile.ps1))
- [powershell-profile/Microsoft.PowerShell_profile.ps1](powershell-profile/Microsoft.PowerShell_profile.ps1) — Entry profile loaded by PowerShell (contains [`g-profile`](powershell-profile/Microsoft.PowerShell_profile.ps1) and [`Set-PHPVersion`](powershell-profile/Microsoft.PowerShell_profile.ps1))

## Installation / Usage

1. Ensure Oh My Posh and Terminal-Icons are installed.
2. Place these files under your profile folder (example path used here is `C:\Users\<you>\.config\dotfiles`).
3. Import the profile in your PowerShell profile or copy the contents of [powershell-profile/Microsoft.PowerShell_profile.ps1](powershell-profile/Microsoft.PowerShell_profile.ps1) into your PowerShell profile:
   - The profile currently initializes Oh My Posh with the blueish theme (see the config path in [powershell-profile/Microsoft.PowerShell_profile.ps1](powershell-profile/Microsoft.PowerShell_profile.ps1)).
4. Restart PowerShell.

Example: run your profile manually
```powershell
. $HOME\.config\dotfiles\powershell-profile\Microsoft.PowerShell_profile.ps1
```

## Customization

- To change the active theme, edit the init line in [powershell-profile/Microsoft.PowerShell_profile.ps1](powershell-profile/Microsoft.PowerShell_profile.ps1) to point to any of:
  - [oh-my-posh/blueish.omp.json](oh-my-posh/blueish.omp.json)
  - [oh-my-posh/clean-detailed.omp.json](oh-my-posh/clean-detailed.omp.json)
  - [oh-my-posh/takuya.omp.json](oh-my-posh/takuya.omp.json)

- User helper functions:
  - [`g-profile`](powershell-profile/Microsoft.PowerShell_profile.ps1) — switch GitHub SSH profiles.
  - [`Set-PHPVersion`](powershell-profile/Microsoft.PowerShell_profile.ps1) — adjust PATH to use a Laragon PHP version.
  - [`gpl`](oh-my-posh/user_profile.ps1), [`gtp`](oh-my-posh/user_profile.ps1), [`gts`](oh-my-posh/user_profile.ps1), [`gtc`](oh-my-posh/user_profile.ps1) — git aliases.

## Notes & Troubleshooting

- Terminal font must support the glyphs used by Oh My Posh.
- If oh-my-posh init fails, run the init command shown inside [powershell-profile/Microsoft.PowerShell_profile.ps1](powershell-profile/Microsoft.PowerShell_profile.ps1) manually to inspect errors.
- Check that `Terminal-Icons` and `posh-git` modules are installed (referenced in [oh-my-posh/user_profile.ps1](oh-my-posh/user_profile.ps1)).

## License

Personal configuration — adapt