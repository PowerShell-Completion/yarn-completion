$optionsScriptPath = "$PSScriptRoot\options" | Resolve-Path
$optionsScripts = Get-ChildItem $optionsScriptPath | Where-Object {
	$_.Name -like '*.ps1'
}

# Load all options
$optionsScripts | ForEach-Object {
	. $_.FullName
}
