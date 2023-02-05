<#

#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [string]$BackupPath
)

# Get the current user's SID
# $CurrentUserSID = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).User.Value

# Get the current date
$DateToday = Get-Date -Format "yyyy-MM-dd"

# Get the current user's pinned items file `start.bin`
$PinnedItemsFile_CurrentUser = "$Env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start.bin"

# Backup the current user's pinned items
Copy-Item -Path $PinnedItemsFile_CurrentUser -Destination "$BackupPath\PinnedStartMenuItemsBackup\$DateToday\start.bin"

