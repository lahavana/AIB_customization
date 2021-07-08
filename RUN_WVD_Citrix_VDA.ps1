#VDA Installation
 write-host 'Install Citrix VDA with WorkspaceApp'
 $appName = 'VDA'
 $drive = 'C:\temp\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
write-host  "*** Citrix VDA Installation with WorkspaceApp ***"
& .\VDAServerSetup_2106.exe /quiet /enable_remote_assistance /disableexperiencemetrics /virtualmachine /INSTALL_MCSIO_DRIVER /enable_real_time_transport /enable_hdx_ports /enable_hdx_udp_ports /includeadditional "Citrix Supportability Tools","Machine Identity Service","Citrix User Profile Manager WMI Plugin" /exclude "User Personalization layer","Citrix Files for Outlook","Citrix Files for Windows","Citrix Telemetry Service","Citrix Personalization for App-V - VDA" /components vda,plugins /mastermcsimage 
