function AreEqual($a, $b) {
	try {
		return (
			([string]::IsNullOrEmpty($a) -and [string]::IsNullOrEmpty($b)) -or
			($a -eq $b)
		)
	}
	catch {
		return $a -eq $b
	}
}

function Read-PackageJson {
	begin {
		$ErrorActionPreference = 'SilentlyContinue'
	}

	process {
		$cwd = Get-Location
		$packagePath = Join-Path $cwd 'package.json'

		if (-not (Test-Path $packagePath -PathType Leaf)) {
			return $null
		}

		$packagePath = Resolve-Path $packagePath

		return Get-Content $packagePath | ConvertFrom-Json
	}
}

function Get-PackageScripts {
	begin {
		$ErrorActionPreference = 'SilentlyContinue'
	}

	process {
		$package = Read-PackageJson

		if ((-not $package) -or (-not $package.scripts)) {
			return $()
		}

		$scripts = $package.scripts | Get-Member -MemberType NoteProperty | ForEach-Object {
			$_.Name
		}

		if (-not $scripts) {
			return $()
		}

		return $scripts
	}
}
