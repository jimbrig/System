@echo off
:: Created by: DroniX7 30.11.21
::=========================================== Change Name New Folder Default Date ======================================
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v RenameNameTemplate /t REG_SZ /d "%date%" /f >nul
:: =====================================================================================================================
