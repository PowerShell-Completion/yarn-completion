if (-not $options) {
	$options = [ordered] @{ }
}

# Options for `yarn version`
$options['version'] = [ordered] @{
	'--major'              = @();
	'--minor'              = @();
	'--patch'              = @();
	'--premajor'           = @();
	'--preminor'           = @();
	'--prepatch'           = @();
	'--prerelease'         = @();
	'--preid'              = @();
	'--message'            = @();
	'--no-git-tag-version' = @();
	'--no-commit-hooks'    = @();
}
