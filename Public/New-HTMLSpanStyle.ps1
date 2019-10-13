function New-HTMLSpanStyle {
    [CmdletBinding()]
    param(
        [ScriptBlock] $Content,
        [ValidateScript({$_ -in $Global:RGBColors.Keys -or $_ -match "^#([A-Fa-f0-9]{6})$" -or $_ -eq ""})]
        [string] $Color,
        [ValidateScript({$_ -in $Global:RGBColors.Keys -or $_ -match "^#([A-Fa-f0-9]{6})$" -or $_ -eq ""})]
        [string] $BackGroundColor,
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
    #region Check if color is colorname or hex
    If($Color -match "^#([A-Fa-f0-9]{6})$"){
        $ColorHEX = $Color
    }
    elseif($Color -in $Global:RGBColors.Keys){
        $ColorHEX = ConvertFrom-Color -Color $Color
    }
    If($BackGroundColor -match "^#([A-Fa-f0-9]{6})$"){
        $BackGroundColorHEX = $BackGroundColor
    }
    elseif($BackGroundColor -in $Global:RGBColors.Keys){
        $BackGroundColorHEX = ConvertFrom-Color -Color $BackGroundColor
    }
    #endregion Check if color is colorname or hex
    if ($FontSize -eq 0) {
        $Size = ''
    } else {
        $size = "$($FontSize)px"
    }
    $Style = @{
        style = @{
            'color'            = $ColorHEX
            'background-color' = $BackGroundColorHEX
            'font-size'        = $Size
            'font-weight'      = $FontWeight
            'font-variant'     = $FontVariant
            'font-family'      = $FontFamily
            'font-style'       = $FontStyle
            'text-align'       = $Alignment


            'text-decoration'  = $TextDecoration
            'text-transform'   = $TextTransform
            'direction'        = $Direction
        }
    }

    if ($Alignment) {
        $StyleDiv = @{ }
        $StyleDiv.Align = $Alignment

        New-HTMLTag -Tag 'div' -Attributes $StyleDiv {
            New-HTMLTag -Tag 'span' -Attributes $Style {
                Invoke-Command -ScriptBlock $Content
            }
        }
    } else {
        New-HTMLTag -Tag 'span' -Attributes $Style {
            Invoke-Command -ScriptBlock $Content
        }
    }
    # if ($LineBreak) {
    #    Write-Verbose 'New-SpanStyle - BR'
    #     New-HTMLTag -Tag 'br' -SelfClosing
    # }


}