if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn check`
$options['check'] = @(
	'--integrity',
	'--verify-tree'
)
