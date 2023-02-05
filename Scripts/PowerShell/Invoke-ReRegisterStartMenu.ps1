#Requires -RunAsAdministrator

# This script will re-register the Start Menu and Taskbar
# This is useful if you have a custom theme installed and the Start Menu and Taskbar are not working correctly

# This script is based on the following article:
# https://www.tenforums.com/tutorials/10028-re-register-start-menu-windows-10-a.html

Param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("AllUsers","CurrentUser")]
    [string]$Scope = "AllUsers"
)

if ($Scope -eq "AllUsers") {
    # $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartPage"
    Get-AppxPackage -AllUsers Microsoft.Windows.ShellExperienceHost | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

} else {
    # $RegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartPage"
    Get-AppxPackage Microsoft.Windows.ShellExperienceHost | ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" }
}

