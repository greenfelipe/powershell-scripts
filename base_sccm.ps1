$date = (Get-Date -UFormat "%Y-%m-%d")

Get-CMDevice -Name * | Select-Object Name, ClientActiveStatus, CNLastOnlineTime, CurrentLogonUser, PrimaryUse, UserNAme, DeviceOS, DeviceOSBuild, Domain | export-csv c:\temp\BASE_SCCM$date.csv