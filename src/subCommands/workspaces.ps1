if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['workspaces'] = [ordered] @{
	'info' = @{ };
	'run'  = @{ };
}
