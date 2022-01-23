[console]::beep(2000, 1000)
Add-Type -AssemblyName System.Windows.Forms
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($Path)
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balloon.BalloonTipText = 'Sinfully yours, RedTeam Operator'
$balloon.BalloonTipTitle = "Hello, $Env:USERNAME!"
$balloon.Visible = $true
$balloon.ShowBalloonTip(20000)
