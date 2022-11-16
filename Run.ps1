# Stores your credentials into a credential object used in security operations.
$LogOnTemp = Get-Credential

$TodaysDate = $(get-date).ToString("MM-dd-yyyy")

# Following line contains multiple example info that you need to change.
$StoredUsers = get-adcomputer -Credential $LogOnTemp -Server ADSERVERCHANGETHIS -SearchBase "OU=Computers,DC=google,DC=com" -filter * -properties Lastlogondate, SamAccountName, Enabled | Where-Object {$_.Lastlogondate -lt (Get-Date).adddays(-30)}

# Saves the list of computers to your documents and adds the date to the end.
$StoredUsers | Export-csv -Path "C:\Users\$($env:USERname)\Documents\ADLogonChecker-Log $($TodaysDate).csv" -Force