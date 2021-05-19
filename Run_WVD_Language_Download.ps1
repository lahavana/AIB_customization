#https://docs.microsoft.com/en-us/azure/virtual-desktop/language-packs#prerequisites


 # OS Optimizations for WVD
 write-host 'AIB Customization: OS Optimizations for WVD'
 $appName = 'optimize'
 $drive = 'C:'
 New-Item -Path $drive -Name $appName -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName
 New-Item -Path $LocalPath -Name "language" -ItemType Directory -ErrorAction SilentlyContinue
 set-Location $LocalPath

Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.1.191206-1406.vb_release_CLIENTLANGPACKDVD_OEM_MULTI.iso" -OutFile "01_LANGUAGEPACK.iso"
Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.1.191206-1406.vb_release_amd64fre_FOD-PACKAGES_OEM_PT1_amd64fre_MULTI.iso" -OutFile "02_FODPACK.iso"
Invoke-WebRequest "https://software-download.microsoft.com/download/pr/19041.508.200905-1327.vb_release_svc_prod1_amd64fre_InboxApps.iso" -OutFile "03_InboxApps.iso"


$isos = Get-Childitem -Path $LocalPath -Include *.iso -Recurse


foreach ($iso in $isos.name)
    {
    $Mount = Mount-DiskImage -ImagePath $($LocalPath+"\"+$iso)
    write-host $($LocalPath+"\"+$iso)
    $driveLetter = ($mount | Get-Volume).DriveLetter
        
        if (Test-Path $($driveLetter+":\x64\langpacks"))
            {
            write-host "$($driveLetter+":\x64\langpacks") exists"
            Copy-Item $($driveLetter+":\x64\langpacks\*") -Destination $($LocalPath+"\language") -Recurse
            Copy-Item $($driveLetter+":\LocalExperiencePack\*") -Destination $($LocalPath+"\language") -Recurse
            }
        if (Test-Path $($driveLetter+":\metadata"))
            {
            write-host "$($driveLetter+":\metadata") exists"
            Copy-Item $($driveLetter+"\*") -Destination $($LocalPath+"\language") -Recurse
            }
        if (Test-Path $($driveLetter+":\amd64fre"))
            {
            write-host "$($driveLetter+":\amd64fre") exists"
            Copy-Item $($driveLetter+":\amd64fre\*") -Destination $($LocalPath+"\language") -Recurse
            }
    }



write-host 'AIB Customization: Finished OS Optimizations script'
