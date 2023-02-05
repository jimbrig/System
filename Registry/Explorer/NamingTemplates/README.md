# Naming Templates

> Windows “NamingTemplates” are located in the registry at `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates` by default. The `NamingTemplates` key is not originally there by default and may need to be added.

## Contents

[TOC]

## Registry Files

- [Set-NewFolder-NamingTemplate-to-Folder.reg](Set-NewFolder-NamingTemplate-to-Folder.reg): Changes Default New Folder Name
- [Set-Shortcut-Label-to-Link.reg](Set-Shortcut-Label-to-Link.reg): Changes Shortcut Syntax
- [Undo-NamingTemplates.reg](Undo-NamingTemplates.reg): Resets Registry to defaults

## Changing the Name of a New Folder

When using the “New”context menu in explorer and selecting "Folder", by default the folder's name will be "New Folder". You can alter the name of this folder if you like to be something else.

The registration (`.reg`) file: [Set-NewFolder-NamingTemplate-to-Folder.reg](Set-NewFolder-NamingTemplate-to-Folder.reg) will change the label from "New Folder" to just "Folder".

```registry
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates]
"RenameNameTemplate"="Folder"
```

### Example of a New Folder

In the image below, I created a new folder via the explorer context menu and notice that its name is "Folder", not "New Folder":

![image-20230204173922191](C:\Users\jimmy\AppData\Roaming\Typora\typora-user-images\image-20230204173922191.png)

## Changing the Syntax for Created Shortcuts

By default, when a new shortcut (link) is created in Windows, it will append ` - Shortcut` to the file/folder name. You may also alter this via the `NamingTemplates` feature.

In the [Set-Shortcut-Label-to-Link.reg](Set-Shortcut-Label-to-Link.reg) registration (`.reg`) file, I changed my shortcut label from ` - Shortcut` to `  (Link)`:

```registry
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates]
"ShortcutNameTemplate"="%s (Link).lnk"
```
 ### Example of New Shortcut

In the image below, I generated a shortcut from the Folder generated above and notice how it no longer uses the `Folder - Shortcut` syntax, but my new `Folder (Link)` syntax: 

![image-20230204174150071](C:\Users\jimmy\AppData\Roaming\Typora\typora-user-images\image-20230204174150071.png)
