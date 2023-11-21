$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path (Split-Path $tools) "fonts"
 
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

Install-ChocolateyZipPackage `
  -PackageName "$env:ChocolateyPackageName" `
  -Url 'https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip' `
  -Checksum 'FF970A5D4561A04F102A7CB781ADBD6AC4E9B6C460914C7A101F15ACB7F7D1A4' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $package
 
$AddFont = Join-Path (Get-CurrentDirectory) 'Add-Font.ps1'
& $AddFont -Path "$package\Inter UI (OTF)"
Remove-Item -Recurse -Force $package
