. $PSScriptRoot\..\utils.ps1

if (-not $commandValues) {
	$commandValues = [ordered] @{ }
}

$commandValues['run'] = {
	$scriptNames = Get-PackageScripts

	return $scriptNames
}
