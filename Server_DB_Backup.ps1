$server = 'Sam-PC\SQL2019'
$database = 'ez911Data'
$temp_path = 'C:\Backup\temp'
$backup_path = 'C:\Backup\ez911Data'

New-Item -ItemType Directory -Force -Path C:\Backup\Temp
New-Item -ItemType Directory -Force -Path C:\Backup\ez911Data

# Backup database and compresses it. 

Backup-DbaDatabase -SqlInstance $server -Database $database -Path $temp_path -Type Full -CompressBackup

# Move temp folder to ez911Data folder

Get-ChildItem -Path $temp_path -Recurse | Move-Item -Destination $backup_path

# Filter

Get-ChildItem –Path $backup_path -Recurse | Where-Object { ($_.LastWriteTime -gt (Get-Date).AddDays(-8)) -and ($_.LastWriteTime.DayOfWeek -eq 'Sunday') -and ($_.LastWriteTime -gt (Get-Date).AddDays((-22)) -and ($_.LastWriteTime.Day -eq 1) -and ($_.LastWriteTime -gt (Get-Date).AddDays(-91)) -and ($_.LastWriteTime -lt (Get-Date).AddDays(-91))) } | Remove-Item