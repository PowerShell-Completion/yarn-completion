function Get-2ndCompletions([string] $WordToComplete, [string] $Command) {
	if (-not $commandValues) {
		. $PSScriptRoot\..\values.ps1
	}
	if (-not $subCommands) {
		. $PSScriptRoot\..\subCommands.ps1
	}
	if (-not $options) {
		. $PSScriptRoot\..\options.ps1
	}

	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = @()

	# Command's values
	if ($commandValues[$Command]) {
		$completions += Invoke-Command -ScriptBlock $commandValues[$Command] | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'DynamicKeyword', $_)
		}
	}
	# Sub-commands
	if ($subCommands[$Command]) {
		$completions += $subCommands[$Command].Keys | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
		}
	}
	# Command's options
	if ($options[$Command]) {
		$completions += $options[$Command].Keys | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
		}
	}

	return $completions
}
