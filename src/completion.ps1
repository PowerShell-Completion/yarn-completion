@('yarn', 'yarn.cmd') | ForEach-Object {
	Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {
		param($wordToComplete, $commandAst, $cursorPosition)

		$subCommand = $commandAst.CommandElements[1].Value

		switch ($subCommand) {
			'global' {
				. $PSScriptRoot\sub-commands\global.ps1
			}
			Default {
				. $PSScriptRoot\commands.ps1

				# Don't complete any word after sub-command when it isn't one of above commands.
				if ($subCommand -in $cmds) {
					$cmds = @()
				}
			}
		}

		$cmds |
			Where-Object { $_ -like "$wordToComplete*" } |
			Sort-Object |
			ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
			}
	}
}
