 # Language installation for WVD 2009 Inbox Apps
 write-host 'AIB Customization: Update Inbox Apps for Multi Language'
 $appName = 'optimize'
 $drive = 'C:'
 New-Item -Path $drive -Name $appName -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath


#########################################
##Set Inbox App Package Content Stores##
[string] $AppsContent = $($LocalPath+"\language\language_InboxApps")

##Update installed Inbox Store Apps##
foreach ($App in (Get-AppxProvisionedPackage -Online)) {
	$AppPath = $AppsContent + $App.DisplayName + '_' + $App.PublisherId
	Write-Host "Handling $AppPath"
	$licFile = Get-Item $AppPath*.xml
	if ($licFile.Count) {
		$lic = $true
		$licFilePath = $licFile.FullName
	} else {
		$lic = $false
	}
	$appxFile = Get-Item $AppPath*.appx*
	if ($appxFile.Count) {
		$appxFilePath = $appxFile.FullName
		if ($lic) {
			Add-AppxProvisionedPackage -Online -PackagePath $appxFilePath -LicensePath $licFilePath 
		} else {
			Add-AppxProvisionedPackage -Online -PackagePath $appxFilePath -skiplicense
		}
	}
}


write-host 'AIB Customization: Update Inbox Apps for Multi Language'
