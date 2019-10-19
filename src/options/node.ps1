if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn node`
$options['node'] = @(
	'--into'
)
