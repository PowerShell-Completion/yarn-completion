. $PSScriptRoot\..\utils.ps1

if (-not $commandValues) {
	$commandValues = [ordered] @{ }
}

$commandValues['run'] = {
	param ([string] $WordToComplete)

	$scriptNames = Get-PackageScripts | Where-Object {
		$_ -like "$WordToComplete*"
	}

	return $scriptNames
}
