if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn remove`
$options['remove'] = @(
	'-W',
	'--ignore-workspace-root-check'
)
