if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn audit`
$options['audit'] = @(
	'--summary',
	'--groups',
	'--level'
)
