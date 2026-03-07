# This script sets up np.ps1 for global use by copying it to a user scripts directory and updating the PATH if needed.
# Usage: Run this script from the project folder containing np.ps1

$scriptName = "np.ps1"
$cmdName = "np.cmd"
$userScripts = "$env:USERPROFILE\scripts"
$source = Join-Path $PSScriptRoot $scriptName
$dest = Join-Path $userScripts $scriptName
$cmdDest = Join-Path $userScripts $cmdName

# Create scripts directory if it doesn't exist
if (!(Test-Path $userScripts)) {
    New-Item -ItemType Directory -Path $userScripts | Out-Null
}

# Copy np.ps1 to scripts directory
Copy-Item $source $dest -Force

# Create a wrapper batch file for easy calling
$cmdContent = @'
@echo off
setlocal
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0np.ps1" %*
'@
Set-Content -Path $cmdDest -Value $cmdContent


# Add scripts directory to user PATH if not already present (persistent)
$envPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")
if (-not ($envPath -split ";" | Where-Object { $_ -eq $userScripts })) {
    [System.Environment]::SetEnvironmentVariable("PATH", "$envPath;$userScripts", "User")
    Write-Host "Added $userScripts to your user PATH. You may need to restart your terminal."
} else {
    Write-Host "$userScripts is already in your PATH."
}

# Add scripts directory to current session PATH if not already present
if (-not ($env:PATH -split ";" | Where-Object { $_ -eq $userScripts })) {
    $env:PATH = "$env:PATH;$userScripts"
    Write-Host "Added $userScripts to your current session PATH."
} else {
    Write-Host "$userScripts is already in your current session PATH."
}

# Check for shadowing by alias, function, or module named 'np'
$npCommand = Get-Command np -ErrorAction SilentlyContinue
if ($npCommand -and ($npCommand.Source -ne $cmdDest -and $npCommand.Source -ne $dest)) {
    Write-Warning "Another command, alias, or module named 'np' is present: $($npCommand.Source) ($($npCommand.CommandType)). This may shadow your intended np.cmd."
    Write-Host "To ensure you run your script, use the full path: `"$cmdDest`" or `"np.cmd`" instead of just `"np`"."
}

Write-Host "np is now globally available. You can call it from any folder:"
Write-Host "np -name my_new_project -description 'My new D project'"
