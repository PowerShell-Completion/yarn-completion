if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['owner'] = [ordered] @{
	'list'   = @{ };
	'add'    = @{ };
	'remove' = @{ };
}
