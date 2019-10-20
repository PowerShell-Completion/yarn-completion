if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['global'] = [ordered] @{
	'add'                 = @{ };
	'bin'                 = @{ };
	'list'                = @{ };
	'remove'              = @{ };
	'upgrade'             = @{
		options = [ordered] @{
			'--latest' = @();
		};
	};
	'upgrade-interactive' = @{
		options = [ordered] @{
			'--latest' = @();
		};
	};
}
