function New-HTMLTimelineItem {
    [CmdletBinding()]
    param(
        [DateTime] $Date = (Get-Date),
        [string] $HeadingText,
        [string] $Text,
        [nullable[RGBColors]] $Color
    )
    $Attributes = @{
        class     = 'timelineSimple-item'
        "date-is" = $Date
    }

    if ($null -ne $Color) {
        $RGBcolor = ConvertFrom-Color -Color $Color
        $Style = "color: $RGBcolor;"
    } else {
        $Style = ''
    }
    # $Script:HTMLSchema.Features.TimeLine = $true
    New-HTMLTag -Tag 'div' -Attributes $Attributes -Value {
        New-HTMLTag -Tag 'h1' -Attributes @{ class = 'timelineSimple'; style = $style } {
            $HeadingText
        }
        New-HTMLTag -Tag 'p' -Attributes @{ class = 'timelineSimple'} {
            $Text -Replace [Environment]::NewLine, '<br>' -replace '\n', '<br>'
        }
    }
}