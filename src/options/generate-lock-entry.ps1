if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn generate-lock-entry`
$options['generate-lock-entry'] = @(
	'--use-manifest',
	'--resolved',
	'--registry'
)
