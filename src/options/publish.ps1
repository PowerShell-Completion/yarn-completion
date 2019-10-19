if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn publish`
$options['publish'] = @(
	'--new-version',
	'--access',
	'--tag'
)
