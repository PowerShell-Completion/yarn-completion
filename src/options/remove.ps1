if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn remove`
$options['remove'] = [ordered] @{
	'-W'                            = @();
	'--ignore-workspace-root-check' = @();
}
