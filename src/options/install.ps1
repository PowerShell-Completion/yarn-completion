if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn install`
$options['install'] = [ordered] @{
	'-A'      = @();
	'--audit' = @();
}
