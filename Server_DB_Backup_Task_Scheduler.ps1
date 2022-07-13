$backup_script = 'C:\Users\seldr\Documents\GitHub\EzDataBackup\Server_DB_Backup.ps1'

$Trigger= New-ScheduledTaskTrigger -At 3:00am –Daily # Specify the trigger settings
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument '$backup_script' # Specify what program to run and with its parameters
Register-ScheduledTask -TaskName "ezDataBackup" -Trigger $Trigger  -Action $Action –Force # Specify the name of the task