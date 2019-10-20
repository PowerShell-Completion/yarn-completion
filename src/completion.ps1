Register-ArgumentCompleter -Native -CommandName @('yarn', 'yarn.cmd') -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)

	. $PSScriptRoot\commands.ps1
	. $PSScriptRoot\utils.ps1

	$searchBlock = { $_ -like "$wordToComplete*" }

	$completions = @()

	# Main command
	$mainCommand = if ($commandAst.CommandElements[1]) { $commandAst.CommandElements[1].Value } else { $null }
	# Sub-command or command's options
	$subCommandOrOption = if ($commandAst.CommandElements[2]) { $commandAst.CommandElements[2].Value } else { $null }
	# Sub-command's option or option's value of main command
	$subCommandOptionOrOptionValue = if ($commandAst.CommandElements[3]) { $commandAst.CommandElements[3].Value } else { $null }

	# If word to complete is equal to main command, suggest all commands & options of `install` command
	if (AreEqual $mainCommand $wordToComplete) {
		$completions += $commands | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
		}
		$completions += $options['install'].Keys | Where-Object $searchBlock | ForEach-Object {
			[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
		}
	}
	# If word to complete is equal to sub-command/command's options, suggest sub-commmands and command's options
	elseif (AreEqual $subCommandOrOption $wordToComplete) {
		# Sub-commands
		if ($subCommands[$mainCommand]) {
			$completions += $subCommands[$mainCommand].Keys | Where-Object $searchBlock | ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
			}
		}
		# Main command's options
		if ($options[$mainCommand]) {
			$completions += $options[$mainCommand].Keys | Where-Object $searchBlock | ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
			}
		}
	}
	# If word to complete is equal to main command option's values/sub-command's options,
	# suggest main command option's values or sub-command's options
	elseif (AreEqual $subCommandOptionOrOptionValue $wordToComplete) {
		# Main command option's value
		if ($options[$mainCommand][$subCommandOrOption]) {
			$optionValues = $options[$mainCommand][$subCommandOrOption]

			$completions += $optionValues | Where-Object $searchBlock | ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
			}

			# Immediately return if it's command's value completion
			return $completions
		}

		# Sub-command's options
		if ($subCommands[$mainCommand][$subCommandOrOption]) {
			$subCommand = $subCommands[$mainCommand][$subCommandOrOption]
			$subCommandOptionOrOptionValues = if ($subCommand.options) { $subCommand.options.Keys } else { $null }

			$completions += $subCommandOptionOrOptionValues | Where-Object $searchBlock | ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
			}
		}
	}

	# Always suggest global options
	$completions += $globalOptions | Where-Object $searchBlock | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	return $completions
}
