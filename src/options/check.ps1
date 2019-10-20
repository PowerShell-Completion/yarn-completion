if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn check`
$options['check'] = [ordered] @{
	'--integrity'   = @();
	'--verify-tree' = @()
}
