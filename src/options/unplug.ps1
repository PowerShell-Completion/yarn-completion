if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn unplug`
$options['unplug'] = [ordered] @{
	'--clear'     = @();
	'--clear-all' = @();
}
