$string = Read-Host -Prompt "Qual texto deseja procurar?"

$DomainName = $env:USERDNSDOMAIN

write-host "Procurando GPOs em $DomainName"
Import-Module grouppolicy
$allGposInDomain = Get-GPO -All -Domain $DomainName
[string[]] $MatchedGPOList = @()

Write-Host "Iniciando busca...."
foreach ($gpo in $allGposInDomain) {
$report = Get-GPOReport -Guid $gpo.Id -ReportType Xml
if ($report -match $string) {
write-host "********** Encontrei em: $($gpo.DisplayName) **********" -foregroundcolor "Green"
$MatchedGPOList += "$($gpo.DisplayName)";
} # end if
else {
Write-Host "Não encontrei: $($gpo.DisplayName)"
} # end else
} # end foreach
write-host "`r`n"
write-host "Resultados: **************" -foregroundcolor "Yellow"
foreach ($match in $MatchedGPOList) {
write-host "Encontrei em: $($match)" -foregroundcolor "Green"
}
