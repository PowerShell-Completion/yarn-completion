if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn audit`
$options['audit'] = [ordered] @{
	'--summary' = @();
	'--groups'  = @(
		'devDependencies',
		'dependencies',
		'optionalDependencies'
	);
	'--level'   = @(
		'info',
		'low',
		'moderate',
		'high',
		'critical'
	);
}
