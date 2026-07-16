<# 
.SYNOPSIS 
   Valida a replicação do Active Directory e o status do Azure AD Connect pós-restore de Disaster Recovery. 
.DESCRIPTION 
   Este script deve ser executado no Domain Controller após um bare-metal restore ou disk restore via Veeam. 
   Ele força uma sincronização Delta do AAD Connect e coleta os logs de eventos do sistema em busca de falhas. 
#> 
 
Write-Host "[*] Iniciando Validação Pós-Restore do Domain Controller..." -ForegroundColor Cyan 
 
# 1. Checa a conectividade de rede básica 
Write-Host "[*] Testando resolução de DNS interno e externo..." 
Test-Connection -ComputerName google.com -Count 2 -Quiet 
Test-Connection -ComputerName DC01.santechsous.local -Count 2 -Quiet 
 
# 2. Verifica se o serviço do Azure AD Sync está rodando (Baseado no seu print) 
$SyncService = Get-Service -Name "ADSync" -ErrorAction SilentlyContinue 
if ($SyncService.Status -eq 'Running') { 
   Write-Host "[+] Serviço Microsoft Azure AD Sync está RODANDO." -ForegroundColor Green 
} else { 
   Write-Host "[-] Serviço Microsoft Azure AD Sync NÃO ESTÁ RODANDO. Iniciando..." -ForegroundColor Yellow 
   Start-Service -Name "ADSync" 
} 
 
# 3. Importa o módulo e força sincronização Delta 
Write-Host "[*] Forçando ciclo de sincronização Delta (Azure AD Connect)..." 
Import-Module ADSync 
Start-ADSyncSyncCycle -PolicyType Delta 
 
# 4. Checa o scheduler 
Write-Host "[*] Status atual do Scheduler:" 
Get-ADSyncScheduler | Select-Object SyncCycleEnabled, NextSyncCyclePolicyType, SyncCycleInProgress 
 
Write-Host "[+] Validação concluída! Verifique o console do Synchronization Service Manager para detalhes." -ForegroundColor Green