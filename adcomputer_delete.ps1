#Setar a variável com o nome do domínio que deseja excluir as máquinas
$dc = Get-ADDomainController -DomainName bbmapfre.corp -Discover -NextClosestSite

#Setar a variável com as informações de usuário administrator do domínio e senha
$senha = Get-Credential

Get-ADComputer -identity HOSTNAMEDOCOMPUTADOR -server $dc.HostName[0] -Credential $senha | Remove-ADObject -recursive -Confirm:$false -verbose