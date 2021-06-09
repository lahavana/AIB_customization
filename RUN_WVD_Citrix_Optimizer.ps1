 #OS Optimizations for WVD
 #Change the $osOptURL to your own created in the script "Create_WVD_Optimization
 #Copy to C:\optimize
 write-host 'AIB Customization: OS Optimizations for WVD'
 $appName = 'optimize'
 $drive = 'C:\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 #$osOptURL = 'https://sawvdautimation.blob.core.windows.net/wvdoptimization/CitrixOptimizer_202106.zip'
 $osOptURL = 'https://sawvdautimation.blob.core.windows.net/wvdoptimization/CitrixOptimizer_202106.zip'
 $osOptURLexe = 'CitrixOptimizer.zip'
 $outputPath = $LocalPath + '\' + $osOptURLexe
 Invoke-WebRequest -Uri $osOptURL -OutFile $outputPath
 write-host 'AIB Customization: Starting OS Optimizations with Citrix Optimizer'
 Expand-Archive -LiteralPath $outputPath -DestinationPath $($Localpath+"\"+$($osOptURLexe.Split('.')[0])) -Force -Verbose
 #Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose
 Set-Location -Path "$LocalPath\\CitrixOptimizer"
 $Template = "$LocalPath\\CitrixOptimizer"

 #Run Citrix Optimize
    .\CtxOptimizerEngine.ps1 "$Template\\Templates\Citrix_Windows_10_2009.xml" -Mode Execute
    write-host 'AIB Customization: Finished OS Optimizations for WVD with Citrix Optimizer'
