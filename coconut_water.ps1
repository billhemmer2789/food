[console]::beep(4000, 3000)
Add-Type -AssemblyName System.Windows.Forms
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($Path)
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balloon.BalloonTipText = '—Sinfully yours, Red Team Operator'
$balloon.BalloonTipTitle = "Hello, $Env:USERNAME"
$balloon.Visible = $true
$balloon.ShowBalloonTip(20000)
Start-Sleep 15
[console]::beep(2000, 80)
Start-Sleep 0.015
[console]::beep(2000, 80)
$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("The first task has finished")
