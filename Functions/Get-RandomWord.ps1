function Get-RandomWord {
    param (
        [int]$NumberOfWords
    )
    
    $parentFolder = Split-Path -Path $PSScriptRoot -Parent
    $words = get-content $ParentFolder\words\words.txt

    $SelectedWords = @()

    for ($i = 0; $i -lt $NumberOfWords; $i++) {
        $random = Get-Random -Minimum 0 -Maximum $words.Length
        $SelectedWords += $words[$random]
    }
    
    return $SelectedWords
}