if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn autoclean`
$options['autoclean'] = @(
	'-I',
	'--init',
	'-F',
	'--force'
)
