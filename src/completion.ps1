Register-ArgumentCompleter -Native -CommandName @('yarn', 'yarn.cmd') -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)

	. $PSScriptRoot\lib.ps1
	. $PSScriptRoot\utils.ps1

	$searchBlock = { $_ -like "$wordToComplete*" }
	$completions = @()

	# Main command
	$command = if ($commandAst.CommandElements[1]) { $commandAst.CommandElements[1].Value } else { $null }
	# Command's value or sub-command or command's options
	$commandSubPart = if ($commandAst.CommandElements[2]) { $commandAst.CommandElements[2].Value } else { $null }
	# Sub-command's option or option's value of main command
	$command2ndSubPart = if ($commandAst.CommandElements[3]) { $commandAst.CommandElements[3].Value } else { $null }

	# If word to complete is equal to command part, suggest all commands & options of `install` command
	if (Compare-CommandElement $command $wordToComplete) {
		$completions += Get-1stCompletions -WordToComplete $wordToComplete
	}
	# If word to complete is equal to command sub-part, suggest command's values and sub-commmands and command's options
	elseif (Compare-CommandElement $commandSubPart $wordToComplete) {
		$completions += Get-2ndCompletions -WordToComplete $wordToComplete -Command $command
	}
	# If word to complete is equal to second sub-part,
	# suggest main command option's values or sub-command's options
	elseif (Compare-CommandElement $command2ndSubPart $wordToComplete) {
		$completions += Get-3rdCompletions -WordToComplete $wordToComplete -Command $command -CommandSubPart $commandSubPart
	}

	# Always suggest global options
	$completions += Get-GlobalOptionCompletions | Where-Object $searchBlock | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	return $completions
}
