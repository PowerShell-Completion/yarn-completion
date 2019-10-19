if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['cache'] = [ordered] @{
	'list'  = @{
		options = @(
			'--pattern'
		);
	};
	'dir'   = @{ };
	'clean' = @{ };
}
