function Get-1stCompletions([string] $WordToComplete) {
	if (-not $commands) {
		. $PSScriptRoot\..\commands.ps1
	}
	if ((-not $options) -or (-not $options['install'])) {
		. $PSScriptRoot\..\options\install.ps1
	}

	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = @()

	# Suggest commands
	$completions += $commands | Where-Object $searchBlock | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
	}
	# Suggest options of `install` command
	$completions += $options['install'].Keys | Where-Object $searchBlock | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	return $completions
}
