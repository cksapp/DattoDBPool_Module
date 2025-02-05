function Add-DBPoolApiKey {
<#
    .SYNOPSIS
        Sets the API key for the DBPool.

    .DESCRIPTION
        The Add-DBPoolApiKey cmdlet sets the API key which is used to authenticate API calls made to DBPool.

        Once the API key is defined, the secret key is encrypted using SecureString.

        The DBPool API key is retrieved via the DBPool UI at My Profile -> API key

    .PARAMETER ApiKey
        Defines your API key for the DBPool.

    .PARAMETER Force
        Forces the setting of the DBPool API key.

    .INPUTS
        [SecureString] - The API key for the DBPool.

    .OUTPUTS
        [void] - No output is returned.

    .EXAMPLE
        Add-DBPoolApiKey

        Prompts to enter in your personal API key.

    .EXAMPLE
        Add-DBPoolApiKey -ApiKey $secureString
        Read-Host "Enter your DBPool API Key" -AsSecureString | Add-DBPoolApiKey

        Sets the API key for the DBPool.

    .NOTES
        N/A

    .LINK
        https://datto-dbpool-api.kentsapp.com/Internal/apiKeys/Add-DBPoolApiKey/
#>

    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
    [Alias("Set-DBPoolApiKey")]
    [OutputType([void])]
    param (
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = "API Key for authorization to DBPool.")]
        [ValidateNotNullOrEmpty()]
        [securestring]$apiKey,

        [switch]$Force
    )

    begin {}

    process {

        if ($Force -or $PSCmdlet.ShouldProcess("Name: DBPool_ApiKey Value: $apiKey", 'Set variable')) {
            Write-Verbose 'Setting the DBPool API Key.'
            Set-Variable -Name 'DBPool_ApiKey' -Value $apiKey -Option ReadOnly -Scope Global -Force -Confirm:$false
        }

    }

    end {}
}
