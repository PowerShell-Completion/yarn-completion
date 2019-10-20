if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn autoclean`
$options['autoclean'] = [ordered] @{
	'-I'      = @();
	'--init'  = @();
	'-F'      = @();
	'--force' = @();
}
