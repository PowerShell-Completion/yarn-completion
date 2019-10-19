if (-not $subCommands) {
	$subCommands = [ordered] @{ }
}

$subCommands['licenses'] = [ordered] @{
	'list'                = @{ };
	'generate-disclaimer' = @{ };
}
