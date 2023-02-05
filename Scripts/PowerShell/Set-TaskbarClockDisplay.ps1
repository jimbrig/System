<#
    .SYNOPSIS
        Set the Taskbar Clock Display to show or hide seconds.

    .DESCRIPTION
        Set the Taskbar Clock Display to show or hide seconds.

    .PARAMETER ShowSeconds
        Use this switch parameter to show seconds in the Taskbar Clock Display.

    .PARAMETER HideSeconds
        Use this switch parameter to hide seconds in the Taskbar Clock Display.

    .EXAMPLE
        Set-TaskbarClockDisplay.ps1 -ShowSeconds

        # Set the Taskbar Clock Display to show seconds.

    .EXAMPLE
        Set-TaskbarClockDisplay.ps1 -HideSeconds

        # Set the Taskbar Clock Display to hide seconds.
    
    .EXAMPLE
        Set-TaskbarClockDisplay.ps1

        # Get current Taskbar Clock Display setting.

    .NOTES
        This script utilizes the Windows Registry to set the Taskbar Clock Display setting. 
        Specifically, it sets the `ShowSecondsInSystemClock` value for the registry key located at:
        `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` to either `1` or `0` (`DWORD`).) 

        ***

        Here's the registration files for the Taskbar Clock Display setting:

        For Show Seconds:
        
        ```
        [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
        "ShowSecondsInSystemClock"=dword:00000001
        ```

        For Hide Seconds:
        
        ```
        [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
        "ShowSecondsInSystemClock"=dword:00000000
        ```

        ***

        This script was tested on Windows 11 and authored by Jimmy Briggs <jimmy.briggs@jimbrig.com>.
        
    .LINK
        https://github.com/jimbrig/PSScripts/Set-TaskbarCloclDisplay/Set-TaskbarClockDisplay.ps1

    .LINK
        https://github.com/jimbrig/PSScripts/Restart-StartMenu/Restart-StartMenu.ps1

    .LINK
        https://www.elevenforum.com/t/turn-on-or-off-show-seconds-in-system-tray-clock-in-windows-11.10591/#Two
    
    .LINK
        https://www.elevenforum.com/t/turn-on-or-off-show-seconds-in-system-tray-clock-in-windows-11.10591/#Three
#>
[CmdletBinding()]
param(
    [switch]$ShowSeconds,
    [switch]$HideSeconds
)

# Set the registry key path.
$regKeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

# Set the registry key value name.
$regValueName = "ShowSecondsInSystemClock"

# Set the registry key value data.
$regValueData = if ($ShowSeconds) { 1 } elseif ($HideSeconds) { 0 } else { $null }

# Set the registry key value data type.
$regValueType = "DWord"

# Get current registry value data.
$regValueDataCurrent = Get-ItemProperty -Path $regKeyPath -Name $regValueName -ErrorAction SilentlyContinue | `
    Select-Object -ExpandProperty $regValueName

# If the current registry value data is the same as the new registry value data, exit.
if ($regValueData -eq $regValueDataCurrent) {
    Write-Host "The Taskbar Clock Display is already set to $(if ($regValueData) { "show" } else { "hide" }) seconds."
    Exit
}

# If the current registry value data is not the same as the new registry value data, continue.
Write-Host "The Taskbar Clock Display is currently set to $(if ($regValueDataCurrent) { "show" } else { "hide" }) seconds."

# Inform the user of the new registry value data.
if ($regValueData) {
    Write-Host "Setting the Taskbar Clock Display to show seconds..."
} else {
    Write-Host "Setting the Taskbar Clock Display to hide seconds..."
}

# Apply changes to registry
if ($regValueData) {
    Set-ItemProperty -Path $regKeyPath -Name $regValueName -Value $regValueData -Type $regValueType
}

# Restart the Start Menu process.
Write-Host "Restarting the Start Menu process..." -ForegroundColor Yellow

If (Get-Command Restart-StartMenu) {
    Restart-StartMenu
} Else {
    Stop-Process -Name "StartMenuExperienceHost" -Force
    Start-Process -FilePath "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe"
}

# End of script
