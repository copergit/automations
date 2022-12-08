#Check BitLocker prerequisites
#set-executionpolicy remotesigned
$TPMNotEnabled = Get-WmiObject win32_tpm -Namespace root\cimv2\security\microsofttpm | where {$_.IsEnabled_InitialValue -eq $false} -ErrorAction SilentlyContinue
$TPMEnabled = Get-WmiObject win32_tpm -Namespace root\cimv2\security\microsofttpm | where {$_.IsEnabled_InitialValue -eq $true} -ErrorAction SilentlyContinue
$WindowsVer = Get-WmiObject -Query 'select * from Win32_OperatingSystem where (Version like "6.2%" or Version like "6.3%" or Version like "10.0%") and ProductType = "1"' -ErrorAction SilentlyContinue
$BitLockerReadyDrive = Get-BitLockerVolume -MountPoint $env:SystemDrive -ErrorAction SilentlyContinue
$BitLockerDecrypted = Get-BitLockerVolume -MountPoint $env:SystemDrive | where {$_.VolumeStatus -eq "FullyDecrypted"} -ErrorAction SilentlyContinue
$hostname=$env:computername.ToString().ToLower().Trim()
$log_filename=$hostname+".csv"

#Step 1 - Check if TPM is enabled and initialise if required
if ($WindowsVer -and !$TPMNotEnabled) 
{
Initialize-Tpm -AllowClear -AllowPhysicalPresence -ErrorAction SilentlyContinue
}

#Step 2 - Check if BitLocker volume is provisioned and partition system drive for BitLocker if required
if ($WindowsVer -and $TPMEnabled -and !$BitLockerReadyDrive) 
{
Get-Service -Name defragsvc -ErrorAction SilentlyContinue | Set-Service -Status Running -ErrorAction SilentlyContinue
BdeHdCfg -target $env:SystemDrive shrink -quiet
}

#Step 3 - If all prerequisites are met, then enable BitLocker
$web_client = new-object system.net.webclient
$info=$web_client.DownloadString("http://192.168.1.99/pcapi.php?pc="+$hostname) | ConvertFrom-Json
   if($info -eq "false"){
          $loc="unknown"
      }else{
	$loc=$info.result[0].location
   }

if ($WindowsVer -and $TPMEnabled -and $BitLockerReadyDrive -and $BitLockerDecrypted) 
{
	Add-BitLockerKeyProtector -MountPoint $env:SystemDrive -TpmProtector
	Enable-BitLocker -MountPoint $env:SystemDrive -RecoveryPasswordProtector -ErrorAction SilentlyContinue

}
"pc,location,windows-vers,TPM-enabled,BL-ready-drive,BL-encrypted" | Out-File -Encoding ascii $log_filename
$hostname+","+$loc+","+$WindowsVer+","+$TPMEnabled+","+$BitLockerReadyDrive+","+(!$BitLokerDecrypted)  | Out-File -Encoding ascii -Append $log_filename
