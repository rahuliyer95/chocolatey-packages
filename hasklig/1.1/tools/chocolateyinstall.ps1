$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path (Split-Path $tools) "fonts"
 
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

Install-ChocolateyZipPackage `
  -PackageName "$env:ChocolateyPackageName" `
  -Url 'https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip' `
  -Checksum '98ECCEC22BC0AE3838A099A911230F62197E681B6A6C30E5149C52F5FC6A95C3' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $package
 
$AddFont = Join-Path (Get-CurrentDirectory) 'Add-Font.ps1'
& $AddFont -Path "$package"
Remove-Item -Recurse -Force $package
