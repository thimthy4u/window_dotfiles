That error happens because **`-PredictionSource` is a feature of PSReadLine 2.1.0 or newer**, and your current installed version is older (most likely the stock version 2.0.0 that came with Windows PowerShell).

Since the parameter doesn't exist in older versions, PowerShell throws an `InvalidArgument` error.

---

## How to Fix It

### 1. Update PSReadLine to the Latest Version

Run this in PowerShell to update to the newer version that supports predictive IntelliSense:

```powershell
Install-Module -Name PSReadLine -AllowClobber -Force

```

> **Note:** If you get a prompt asking to trust the repository (`PSGallery`), type `Y` and press **Enter**.

### 2. Restart PowerShell

Close your terminal window and open a fresh PowerShell session so it loads the updated module.

### 3. Enable Predictive History

Now you can re-run your command without errors:

```powershell
Set-PSReadLineOption -PredictionSource History

```

---

### Pro-Tip: Add Next-Level Suggestions

While `-PredictionSource History` gives you standard inline suggestions, adding these two lines to your profile makes it feel like a modern AI-assisted shell:

```powershell
# Set prediction source to History
Set-PSReadLineOption -PredictionSource History

# Shows predictions in a rich list format instead of just inline text
Set-PSReadLineOption -PredictionView ListView

```

*(You can toggle between list view and inline view anytime using **F2** while typing!)*
