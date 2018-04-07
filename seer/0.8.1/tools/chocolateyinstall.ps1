$tools = Split-Path $MyInvocation.MyCommand.Definition
$packageUrl = "https://sourceforge.net/projects/ccseer/files/Seer-0.8.1.exe/download"
 
$packageArgs = @{
  packageName    = $packageName
  url            = $packageUrl
  fileType       = 'EXE'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
  softwareName   = 'Seer'
  checksum       = 'DB8EDA0E96ECA6457886F353D3B531D234DA5FFC4CFB92D103B5417F9FDBC4B8'
  checksumType   = 'SHA256'
}
 
Install-ChocolateyPackage @packageArgs
