write-host 
write-host "==================================="
write-host "Page File Calculator"
write-host -foreground Red "TIP: CTRL+C to close calculator"
write-host "==================================="
write-host ""
$ram = read-host "Enter your memory amount"

$minpage = 1024*$ram*1.5
$minpageGB = $minpage/1024

$maxpage = 1024*$ram*4
$maxpageGB = $maxpage/1024

$DiskSize = $maxpage+1024
$disksizeGB = $disksize/1024

Write-host
Write-host -foreground Magenta "Your Min pagefile should be set to; " -nonewline
write-host -foreground red $minpage "MB" / $minpageGB "GB"
write-host -foreground Magenta "Your Max pagefile should be set to; " -nonewline
write-host -foreground red $maxpage "MB"/ $maxpageGB "GB"
Write-Host
Write-host -foreground Magenta "Page Disk Size Required; " -nonewline 
write-host -foreground red $DiskSize "MB" / $disksizeGB "GB"
write-host

$message  = 'This is a Choice, choose wisely'
$question = 'Do you want to do another calculation? [Y/N]'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0)
{
    write-host
    write-host -ForegroundColor red "Restarting calculator, clearing terminal screen in 5 seconds."
    Start-Sleep 5
    clear
    & "$PSScriptRoot/Master.ps1"
}
else
{
    write-host
    write-host -ForegroundColor red "You have chosen to quit, closing Powershell in 5 seconds."
    Start-Sleep 5
    exit 
}

# By Timlee90
