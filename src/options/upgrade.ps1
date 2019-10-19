if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn upgrade`
$options['upgrade'] = @(
	'-S',
	'--scope',
	'-L',
	'--latest',
	'-E',
	'--exact',
	'-P',
	'--pattern',
	'-T',
	'--tilde',
	'-C',
	'--caret',
	'-A',
	'--audit'
)
