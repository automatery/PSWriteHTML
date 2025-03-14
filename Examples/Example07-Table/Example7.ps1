Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select-Object -First 10

New-HTML -TitleText 'Title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example7.html -ShowHTML {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '1st section' -CanCollapse -HeaderTextAlignment center {
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -BackgroundColor Lime {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -BackgroundColor LimeGreen {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '2nd section' -BackgroundColor Seashell {
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}