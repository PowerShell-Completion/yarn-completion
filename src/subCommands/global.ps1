if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['global'] = [ordered] @{
	'add'                 = @{ };
	'bin'                 = @{ };
	'list'                = @{ };
	'remove'              = @{ };
	'upgrade'             = @{ };
	'upgrade-interactive' = @{ };
}
