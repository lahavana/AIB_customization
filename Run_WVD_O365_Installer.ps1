$o365config = 
'<Configuration>
  <Add OfficeClientEdition="32" Channel="SemiAnnual" Version="16.0.11929.20838" OfficeMgmtCOM="TRUE" AllowCdnFallback="TRUE" ForceUpgrade="TRUE">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="it-it" />
      <Language ID="de-de" />
	<ExcludeApp ID="OneDrive" />
	<ExcludeApp ID="Groove" />
	<ExcludeApp ID="Teams" />
    </Product>
  <Product ID="VisioProRetail">
      <Language ID="en-us" />
      <Language ID="it-it" />
      <Language ID="de-de" />
    </Product>
  <Product ID="ProjectProRetail">
      <Language ID="en-us" />
      <Language ID="it-it" />
      <Language ID="de-de" />
    </Product>
  </Add>
  <Property Name="SharedComputerLicensing" Value="1" />
  <Property Name="PinIconsToTaskbar" Value="FALSE" />
  <Property Name="SCLCacheOverride" Value="0" />
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <RemoveMSI All="TRUE" />
  <AppSettings>
    <Setup Name="Company" Value="AWESOME" />
  </AppSettings>
  <Display Level="None" AcceptEULA="TRUE" />
  <Logging Level="Standard" Path="C:\temp\O365\Office365ProInstall.log" />
</Configuration>
'


# install O365
write-host 'AIB Customization: Install the latest O365 Version'
$appName = 'O365'
$drive = 'C:\temp'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath
$visCplusURL = 'https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_13929-20296.exe'
$visCplusURLexe = 'o365customization.exe'
$outputPath = $LocalPath + '\' + $visCplusURLexe
Invoke-WebRequest -Uri $visCplusURL -OutFile $outputPath
write-host 'AIB Customization: Starting Install the latest O365 Deployment Tool'
& $outputPath /extract:$LocalPath /quiet
new-item -Path $LocalPath -ItemType File -Name $($appName+".xml") -Value $o365config
Start-Process -FilePath setup.exe -Args "/download O365.xml" -Wait
Start-Process -FilePath setup.exe -Args "/configure O365.xml" -Wait
write-host 'AIB Customization: Finished Install the latest O365 Version'

