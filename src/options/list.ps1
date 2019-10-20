if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn list`
$options['list'] = [ordered] @{
	'--depth'   = @();
	'--pattern' = @();
}
