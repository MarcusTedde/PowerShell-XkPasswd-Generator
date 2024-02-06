function New-XkPwd {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$NumberofWords
    )

    #List of special characters
    $SpecialCharacters = @('!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '{', '}', '[', ']', '|', '\', ':', ';', '"', "'", '<', '>', ',', '.', '?', '/', '~', '`')

    $xkcd = Get-RandomWord -NumberOfWords $NumberofWords
    $NumberofWordsToUpper = Get-Random -Minimum 1 -Maximum $NumberofWords
    $indexesToUpper = Get-Random -InputObject (0..($xkcd.Length - 1)) -Count $NumberofWordsToUpper

    for ($i = 0; $i -lt $xkcd.Length; $i++) {
        if ($indexesToUpper -contains $i) {
            $xkcd[$i] = $xkcd[$i].ToUpper()
        }
    }

    $xkcd = $xkcd -join "-"

    $special = Get-Random -Minimum 0 -Maximum $SpecialCharacters.Length
    $SC = $SpecialCharacters[$special]
    # Add two of the chosen special characters to the start and end of the password followed by two random numbers betweed 0 and 9
    $RandNum = (Get-Random -Minimum 0 -Maximum 9) + (Get-Random -Minimum 0 -Maximum 9)
    $RNS = $RandNum.ToString()
    $xkcd = $RNS + $RNS + $SC + $SC + $xkcd + $SC + $SC + $RNS + $RNS
    return $xkcd

}