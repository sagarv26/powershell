Function Get-Rectangle {
    Param (
        [parameter()]
        [int]$Length,
        [parameter()]
        [int]$Width,
        [parameter()]
        [int]$Area
    )
    If ($PSBoundParameters.ContainsKey('Length') -AND $PSBoundParameters.ContainsKey('Width')) {
        $Area = $Width * $Length
    }
    ElseIf ($PSBoundParameters.ContainsKey('Area') -AND $PSBoundParameters.ContainsKey('Length')) {
        $Width = $Area / $Length
    }
    ElseIf ($PSBoundParameters.ContainsKey('Area') -AND $PSBoundParameters.ContainsKey('Width')) {
        $Length = $Area / $Width
    }
    Else {
        Break
    }

    [pscustomobject]@{
        Length = $Length
        Width = $Width
        Area = $Area
    }

}

Get-Rectangle -Length 10 -Width 5

Get-Rectangle -Width 5 -Area 50
