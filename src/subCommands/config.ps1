if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['config'] = [ordered] @{
	'set'     = @{
		options = @(
			'-g',
			'--global'
		);
	};
	'get'     = @{ };
	'delete'  = @{ };
	'list'    = @{ };
	'current' = @{ };
}
