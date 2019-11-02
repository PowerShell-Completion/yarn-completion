function Get-3rdCompletions([string] $WordToComplete, [string] $Command, [string] $CommandSubPart) {
	if (-not $options) {
		. $PSScriptRoot\..\options.ps1
	}
	if (-not $subCommands) {
		. $PSScriptRoot\..\subCommands.ps1
	}

	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = @()

	# Command option's values
	if ($options[$Command][$CommandSubPart]) {
		$optionValues = $options[$Command][$CommandSubPart]

		$completions += $optionValues | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
		}

		# Immediately return if it's command's value completion
		return $completions
	}

	# Sub-command's options
	if ($subCommands[$Command][$CommandSubPart]) {
		$subCommand = $subCommands[$Command][$CommandSubPart]
		$subCommandOptions = if ($subCommand.options) { $subCommand.options.Keys } else { @() }

		$completions += $subCommandOptions | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
		}
	}

	return $completions
}
