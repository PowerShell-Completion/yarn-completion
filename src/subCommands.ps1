$subCommandsScriptPath = "$PSScriptRoot\subCommands" | Resolve-Path
$subCommandsScripts = Get-ChildItem $subCommandsScriptPath | Where-Object {
	$_.Name -like '*.ps1'
}

# Load all sub-commands
$subCommandsScripts | ForEach-Object {
	. $_.FullName
}
