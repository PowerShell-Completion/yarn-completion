if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn init`
$options['init'] = @(
	'-y',
	'--yes',
	'-p',
	'--private'
)
