$senha = Get-Credential
$NewPassword = ConvertTo-SecureString "SENHADESEJADA" -AsPlainText -Force

ForEach 
($login in (Get-Content localdoarquivo.txt)) {
Set-ADAccountPassword $login	-server DOMÍNIO -NewPassword $NewPassword –Reset -Credential $senha
}