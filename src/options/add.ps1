if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn add`
$options['add'] = [ordered] @{
	'-W'                            = @();
	'--ignore-workspace-root-check' = @();
	'-D'                            = @();
	'--dev'                         = @();
	'-P'                            = @();
	'--peer'                        = @();
	'-O'                            = @();
	'--optional'                    = @();
	'-E'                            = @();
	'--exact'                       = @();
	'-T'                            = @();
	'--tilde'                       = @();
	'-A'                            = @();
	'--audit'                       = @()
}
