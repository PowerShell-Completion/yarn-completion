$libsScriptPath = "$PSScriptRoot\lib" | Resolve-Path
$libsScripts = Get-ChildItem $libsScriptPath | Where-Object {
	$_.Name -like '*.ps1'
}

# Load all sub-commands
$libsScripts | ForEach-Object {
	. $_.FullName
}
