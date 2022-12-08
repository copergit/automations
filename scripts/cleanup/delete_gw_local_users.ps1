# prima di lanciare lo script eseguire (con scelta S al prompt):
# set-executionpolicy remotesigned

function rmUser{

    Param(
        [Parameter(ValueFromPipelineByPropertyName)]
        $Name
    )

    process {
        $user = Get-LocalUser -Name $Name -ErrorAction Stop
        # Remove the user from the account database
        Remove-LocalUser -SID $user.SID
        # Remove the profile of the user (both, profile directory and profile in the registry)
        Get-CimInstance -Class Win32_UserProfile | ? SID -eq $user.SID | Remove-CimInstance
    }
}

$users = Get-LocalUser
echo $users
$KeepUsers = "Tecnico", "Administrator", "DefaultAccount", "Guest",  "WDAGUtilityAccount"
$filteredUsers = Get-LocalUser  | Select * | ? { $KeepUsers -notcontains $_.Name}  | ?  { $_.PrincipalSource -like "Local" }
$GWUsers = $filteredUsers | ? { $_.Description -like "Account utente creato tramite Provider*"}

#record env

$log_filename=$env:computername.ToString().ToLower().Trim()+".log"

"Old gw users delete log file" | Out-File $log_filename

ForEach($user in $GWUsers) 
{
	echo "Removing user: " + $user.Name
	$user.Name | Out-File   -Append $log_filename
	rmUser -Name $user.Name 
}

