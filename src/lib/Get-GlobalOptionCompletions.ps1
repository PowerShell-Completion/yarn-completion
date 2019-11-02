function Get-GlobalOptionCompletions {
	if (-not $globalOptions) {
		. $PSScriptRoot\..\options\__.ps1
	}

	return $globalOptions
}
