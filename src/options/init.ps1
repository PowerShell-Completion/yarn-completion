if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn init`
$options['init'] = [ordered] @{
	'-y'        = @();
	'--yes'     = @();
	'-p'        = @();
	'--private' = @();
}
