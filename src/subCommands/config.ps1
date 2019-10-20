if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['config'] = [ordered] @{
	'set'     = @{
		options = [ordered] @{
			'-g'       = @();
			'--global' = @();
		};
	};
	'get'     = @{ };
	'delete'  = @{ };
	'list'    = @{ };
	'current' = @{ };
}
