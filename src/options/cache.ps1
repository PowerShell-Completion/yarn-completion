if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn cache`
$options['cache'] = @(
	'--pattern'
)
