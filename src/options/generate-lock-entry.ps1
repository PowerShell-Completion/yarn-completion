if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn generate-lock-entry`
$options['generate-lock-entry'] = [ordered] @{
	'--use-manifest' = @();
	'--resolved'     = @();
	'--registry'     = @();
}
