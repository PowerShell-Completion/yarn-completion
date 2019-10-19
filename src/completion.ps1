Register-ArgumentCompleter -Native -CommandName @('yarn', 'yarn.cmd') -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)

	. $PSScriptRoot\commands.ps1
	. $PSScriptRoot\utils.ps1

	$searchBlock = { $_ -like "$wordToComplete*" }
	$completions = @()
	$secondPart = if ($commandAst.CommandElements[1]) { $commandAst.CommandElements[1].Value } else { $null } # Main command
	$thirdPart = if ($commandAst.CommandElements[2]) { $commandAst.CommandElements[2].Value } else { $null } # Sub-command
	$fourthPart = if ($commandAst.CommandElements[3]) { $commandAst.CommandElements[3].Value } else { $null } # Sub-command's option

	# If word to complete is equal to main command, suggest all commands & options of `install` command
	if (AreEqual $secondPart $wordToComplete) {
		$completions += $commands | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
		}
		$completions += $options['install'] | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
		}
	}
	# If word to complete is equal to sub-command, suggest sub-commmands
	if ((-not $(AreEqual $secondPart $wordToComplete)) -and $(AreEqual $thirdPart $wordToComplete)) {
		$completions += $subCommands[$secondPart].Keys | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
		}
	}
	# If word to complete is equal to sub-command's options, suggest sub-command's options
	if (
		(-not $(AreEqual $secondPart $wordToComplete)) -and
		(-not $(AreEqual $thirdPart $wordToComplete)) -and
		$(AreEqual $fourthPart $wordToComplete)
	) {
		$subCommand = $subCommands[$secondPart][$thirdPart]
		$subCommandOptions = if ($subCommand.options) { $subCommand.options } else { $null }

		$completions += $subCommandOptions | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
		}
	}

	# Always suggest global options
	$completions += $globalOptions | Where-Object $searchBlock | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	return $completions
}
