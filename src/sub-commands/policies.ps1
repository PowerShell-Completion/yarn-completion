if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['policies'] = [ordered] @{
	'set-version' = @{ };
}
