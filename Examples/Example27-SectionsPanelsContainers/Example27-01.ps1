﻿Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example27-01.html" -Show {
    New-HTMLSection {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartPie -Name 'Test' -Value 20
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartPie -Name 'Test' -Value 20
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
            }
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
}