. $PSScriptRoot\options.ps1
. $PSScriptRoot\subCommands.ps1

Set-Variable -Name cmds -Option Constant -Value @(
	'add',
	'audit',
	'autoclean',
	'bin',
	'cache',
	'check',
	'config',
	'create',
	'dedupe',
	'generate-lock-entry',
	'global',
	'help',
	'import',
	'info',
	'init',
	'install',
	'licenses',
	'link',
	'list',
	'lockfile',
	'login',
	'logout',
	'node',
	'outdated',
	'owner',
	'pack',
	'policies',
	'prune',
	'publish',
	'remove',
	'run',
	'tag',
	'team',
	'test',
	'unlink',
	'unplug',
	'upgrade',
	'upgrade-interactive',
	'version',
	'versions',
	'why',
	'workspace',
	'workspaces'
)
$commands = [ordered] @{ }

$cmds | ForEach-Object {
	$commands[$_] = @{}

	if ($options[$_]) {
		$commands[$_]['options'] = $options[$_]
	}
	if ($subCommands[$_]) {
		$commands[$_]['subCommands'] = $subCommands[$_]
	}
}
