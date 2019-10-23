$valuesScriptPath = "$PSScriptRoot\values" | Resolve-Path
$valuesScripts = Get-ChildItem $valuesScriptPath | Where-Object {
	$_.Name -like '*.ps1'
}

# Load all command's values
$valuesScripts | ForEach-Object {
	. $_.FullName
}
