if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['global'] = [ordered] @{
	'add'                 = @{ };
	'bin'                 = @{ };
	'list'                = @{ };
	'remove'              = @{ };
	'upgrade'             = @{
		options = @(
			'--latest'
		)
	};
	'upgrade-interactive' = @{
		options = @(
			'--latest'
		)
	};
}
