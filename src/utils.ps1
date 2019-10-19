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
