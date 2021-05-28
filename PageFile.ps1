write-host 
write-host "==================================="
write-host "Page File Calculator"
write-host -foreground Red "TIP: CTRL+C to close calculator"
write-host "==================================="
write-host ""
$ram = read-host "Enter your memory amount"
$minpage = 1024*$ram*1.5
$maxpage = 1024*$ram*3
Write-host
Write-host -foreground Magenta "Your Min pagefile should be set to; " -nonewline
write-host -foreground red "$minpage."
write-host -foreground Magenta "Your Max pagefile should be set to; " -nonewline
write-host -foreground red "$maxpage."
Write-Host

$message  = 'This is a Choice'
$question = 'Do you want to do another calculation? [Y/N]'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0)
{
    & "PSScriptRoot/pagefile.ps1"
}
else
{
    exit 
}

# By Timlee90
