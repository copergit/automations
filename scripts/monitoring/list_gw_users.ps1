# prima di lanciare lo script eseguire (con scelta S al prompt):
# set-executionpolicy remotesigned

$users = Get-LocalUser
echo $users
$KeepUsers = "Tecnico", "Administrator", "DefaultAccount", "Guest",  "WDAGUtilityAccount"
$filteredUsers = Get-LocalUser  | Select * | ? { $KeepUsers -notcontains $_.Name}  | ?  { $_.PrincipalSource -like "Local" }
$GWUsers = $filteredUsers | ? { $_.Description -like "Account utente creato tramite Provider*"}

#record env

$log_filename=$env:computername.ToString().ToLower().Trim()+".csv"

"user,type,state" | Out-File -Encoding ascii $log_filename
$web_client = new-object system.net.webclient
ForEach($user in $GWUsers) 
{
        $info=$web_client.DownloadString("http://192.168.9.251/oldcop/api/uapi.php?un="+$user.Name) | ConvertFrom-Json
	if($info -eq "false"){
		$user.Name+",," | Out-File   -Append -Encoding ascii $log_filename
	}else{ 
		$user.Name+","+$info.type+","+$info.active | Out-File   -Append -Encoding ascii $log_filename
	}
}

