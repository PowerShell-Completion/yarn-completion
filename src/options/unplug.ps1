if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn unplug`
$options['unplug'] = @(
	'--clear',
	'--clear-all'
)
