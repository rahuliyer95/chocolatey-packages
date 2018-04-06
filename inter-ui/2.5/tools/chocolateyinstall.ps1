$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path (Split-Path $tools) "fonts"
 
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

Install-ChocolateyZipPackage `
  -PackageName "$env:ChocolateyPackageName" `
  -Url 'https://github.com/rsms/inter/releases/download/v2.5/Inter-UI-2.5.zip' `
  -Checksum '0A8A74623D254FA6DBF92EF8C564E310727013B2A2CF701F76F448568F7D05E7' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $package
 
$AddFont = Join-Path (Get-CurrentDirectory) 'Add-Font.ps1'
& $AddFont -Path "$package\Inter UI (OTF)"
Remove-Item -Recurse -Force $package
