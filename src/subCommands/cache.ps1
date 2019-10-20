if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['cache'] = [ordered] @{
	'list'  = @{
		options = [ordered] @{
			'--pattern' = @();
		};
	};
	'dir'   = @{ };
	'clean' = @{ };
}
