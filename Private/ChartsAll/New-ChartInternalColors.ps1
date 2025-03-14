﻿function New-ChartInternalColors {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [RGBColors[]]$Colors
    )

    if ($Colors.Count -gt 0) {
        $RGBColor = ConvertFrom-Color -Color $Colors
        $Options.colors = @($RGBColor)
    }
}