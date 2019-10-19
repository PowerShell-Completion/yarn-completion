if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['team'] = [ordered] @{
	'create'  = @{ };
	'destroy' = @{ };
	'add'     = @{ };
	'remove'  = @{ };
	'list'    = @{ };
}
