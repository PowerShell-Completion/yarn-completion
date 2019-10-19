if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['tag'] = [ordered] @{
	'add'    = @{ };
	'remove' = @{ };
	'list'   = @{ };
}
