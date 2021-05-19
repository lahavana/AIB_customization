#https://docs.microsoft.com/en-us/azure/virtual-desktop/language-packs#prerequisites


 # OS Optimizations for WVD
 write-host 'AIB Customization: OS Optimizations for WVD'
 $appName = 'optimize'
 $drive = 'C:'
 New-Item -Path $drive -Name $appName -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath

Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.1.191206-1406.vb_release_CLIENTLANGPACKDVD_OEM_MULTI.iso" -OutFile "19041.1.191206-1406.vb_release_CLIENTLANGPACKDVD_OEM_MULTI.iso"
Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.1.191206-1406.vb_release_amd64fre_FOD-PACKAGES_OEM_PT1_amd64fre_MULTI.iso" -OutFile "19041.1.191206-1406.vb_release_amd64fre_FOD-PACKAGES_OEM_PT1_amd64fre_MULTI.iso"
Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.508.200905-1327.vb_release_svc_prod1_amd64fre_InboxApps.iso" -OutFile "19041.508.200905-1327.vb_release_svc_prod1_amd64fre_InboxApps.iso"


$isos = Get-Childitem -Path $LocalPath -Include *.iso -Recurse
foreach ($iso in $isos.name)
    {
    $Mount = Mount-DiskImage -ImagePath $($LocalPath+"\"+$iso)
    write-host $($LocalPath+"\"+$iso)
    $driveLetter = ($mount | Get-Volume).DriveLetter
    }

write-host 'AIB Customization: Finished OS Optimizations script'
