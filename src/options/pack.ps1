if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn pack`
$options['pack'] = @(
	'-f',
	'--filename'
)
