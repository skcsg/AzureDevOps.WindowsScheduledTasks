# This file should only be modified if it is the one in the `SharedTaskCode` directory.
# Otherwise changes here will be overwritten the next time the Copy Files script is ran.

function Get-WinRmSettings
{
	param
	(
		[string[]] $computers,
		[PSCredential] $credential,
		[bool] $useCredSsp,

		[ValidateSet('HTTP', 'HTTPS')]
		[string] $protocol,

		[bool] $skipCaCheck,
		[bool] $skipCnCheck,
		[bool] $skipRevocationCheck
	)

	[bool] $useSsl = $false
	if ($protocol -ieq 'HTTPS')
	{
		$useSsl = $true
	}

	[hashtable] $winRmSettings = @{
		Computers = $computers
		Credential = $credential
		UseCredSsp = $useCredSsp
		UseSsl = $useSsl
		SkipCaCheck = $skipCaCheck
		SkipCnCheck = $skipCnCheck
		SkipRevocationCheck = $skipRevocationCheck
	}

	return $winRmSettings
}

Export-ModuleMember -Function Get-WinRmSettings