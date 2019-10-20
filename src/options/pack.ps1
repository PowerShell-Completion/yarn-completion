if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn pack`
$options['pack'] = [ordered] @{
	'-f'         = @();
	'--filename' = @();
}
