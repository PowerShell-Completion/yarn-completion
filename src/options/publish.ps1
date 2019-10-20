if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn publish`
$options['publish'] = [ordered] @{
	'--new-version' = @();
	'--access'      = @(
		'public',
		'restricted'
	);
	'--tag'         = @();
}
