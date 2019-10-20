if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn global`
$options['global'] = [ordered] @{
	'--prefix' = @();
}
