if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn upgrade-interactive`
$options['upgrade-interactive'] = @(
	'-S',
	'--scope',
	'--latest',
	'-E',
	'--exact',
	'-T',
	'--tilde',
	'-C',
	'--caret'
)
