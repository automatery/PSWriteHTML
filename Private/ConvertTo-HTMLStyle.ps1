﻿function ConvertTo-HTMLStyle {
    [CmdletBinding()]
    param(
        [nullable[RGBColors]] $Color,
        [nullable[RGBColors]] $BackGroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string]  $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string]  $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string]  $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $LineBreak
    )
    if ($FontSize -eq 0) {
        $Size = ''
    } else {
        $size = "$($FontSize)px"
    }
    $Style = @{
        'color'            = ConvertFrom-Color -Color $Color
        'background-color' = ConvertFrom-Color -Color $BackGroundColor
        'font-size'        = $Size
        'font-weight'      = $FontWeight
        'font-variant'     = $FontVariant
        'font-family'      = $FontFamily
        'font-style'       = $FontStyle
        'text-align'       = $Alignment


        'text-decoration'  = $TextDecoration
        'text-transform'   = $TextTransform
    }
    # Removes empty, not needed values from hashtable. It's much easier then using if/else to verify for null/empty string
    Remove-EmptyValues -Hashtable $Style
    return $Style
}