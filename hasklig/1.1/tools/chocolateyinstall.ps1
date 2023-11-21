$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path (Split-Path $tools) "fonts"
 
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

Install-ChocolateyZipPackage `
  -PackageName "$env:ChocolateyPackageName" `
  -Url 'https://github.com/i-tu/Hasklig/releases/download/v1.2/Hasklig-1.2.zip' `
  -Checksum '9CD35A7449B220DC84F9516C57817E147003FC905A477F1EC727816D9D8A81D4' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $package
 
$AddFont = Join-Path (Get-CurrentDirectory) 'Add-Font.ps1'
& $AddFont -Path "$package"
Remove-Item -Recurse -Force $package
