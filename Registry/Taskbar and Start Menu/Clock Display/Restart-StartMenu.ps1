
<#
.SYNOPSIS
    Restarts the Start Menu process
.DESCRIPTION
    Restarts the Start Menu process by wrapping the Stop-Process and Start-Process cmdlets.
.EXAMPLE
    Restart-StartMenu
    
    # Restarts the Start Menu process
.NOTES
    The same functionality can be achieved by running the following commands from the command line:

    ```cmd
    taskkill /f /im StartMenuExperienceHost.exe
    start C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe
    ```

    This script was tested on Windows 11 and authored by Jimmy Briggs <jimmy.briggs@jimbrig.com>.
.LINK
    https://github.com/jimbrig/PSScripts/Restart-StartMenu/Restart-StartMenu.ps1
.LINK
    https://www.elevenforum.com/t/restart-start-menu-process-in-windows-11.1102/#option4
#>
[CmdletBinding()]
param()

Stop-Process -Name "StartMenuExperienceHost" -Force

Start-Process -FilePath "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe"

# End of script
