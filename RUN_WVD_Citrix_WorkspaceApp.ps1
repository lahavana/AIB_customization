#Workspace App Installation
 write-host 'Install Citrix Workspace App'
 $appName = 'Workspace'
 $drive = 'C:\temp\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 write-host  "*** Citrix WorkspaceApp Installation ***"
 & .\CitrixWorkspaceApp.exe /silent /noreboot /includeSSON /AutoUpdateCheck=disabled
