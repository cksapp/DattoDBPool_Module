function Set-DdbpApiParameters {
    <#
    .SYNOPSIS
    Sets the API Parameters used throughout the module.

    .PARAMETER Url
    Provide Datto DBPool API Url. See Datto DBPool API help files for more information.

    .PARAMETER Key
    Provide Datto DBPool API Key. You can find your user API key at [/web/self](https://dbpool.datto.net/web/self).
    #>
    
    Param(
        [Parameter(Position = 0, Mandatory=$False)]
        [ValidateScript({
            $_ = if ($_ -match '^https://dbpool\.datto\.net/api/v2/?$') { $_ } else { "$_/"}; $true
        })]
        [Uri]$apiUrl = "https://dbpool.datto.net/api/v2/",
        
        [Parameter(Position = 1, Mandatory=$True)]
        [string]$apiKey
    )

    New-Variable -Name apiUrl -Value $apiUrl -Force
    New-Variable -Name apiKey -Value $apiKey -Force
}