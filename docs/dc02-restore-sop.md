# 📄 SOP: Procedimento de Recuperação de Desastre (Restore) - DC02

## 🎯 Objetivo
Este documento descreve o procedimento padronizado para a restauração completa do servidor **DC02** (Active Directory + Azure AD Connect) utilizando o Veeam Backup & Replication, a partir de um cenário de falha crítica ou corrupção de sistema.

## ⚠️ Pré-requisitos
* Acesso administrativo ao Veeam Backup & Replication Console.
* Repositório de backup (`External HDD Repository`) montado e acessível.
* Conectividade de rede estável entre o host físico e o storage.

## 🛠️ Passo a Passo da Execução

### 1. Inicialização do Restore
1. Abra o **Veeam Backup & Replication Console**.
2. Vá até a aba **Home** > **Backups** > **Disk**.
3. Localize o backup do `DC02.santechsous.local`.
4. Selecione a opção **Entire VM Restore** (ou, conforme executado na PoC, **Disk Export** caso o objetivo seja a reconstrução manual do ambiente).

### 2. Execução da Tarefa (Disk Export/Restore)
*   **Seleção de Ponto de Restauração:** Selecione o último ponto de restauração válido (o mais recente antes da falha).
*   **Seleção do Host/Datastore:** Especifique o local de destino para o arquivo de disco (`.vmdk` ou `.vhdx`).
*   **Verificação de Logs:** Monitore a aba **Statistics** no Veeam:
    *   *Locking required backup files*: Confirma que o Veeam está travando os arquivos para evitar corrupção durante a leitura.
    *   *Processing Restore Hard Disks*: Confirma a transferência de dados e a taxa de escrita (ex: 20 MB/s).

### 3. Validação pós-Restore (Critical Path)
Após o restore e o boot do servidor, execute a rotina de validação:
1. **Verificação de Rede:** Certifique-se de que o DC02 possui IP estático e resolve o `DC01` (Primary DC).
2. **Serviços Críticos:**
    *   Abra `services.msc` e valide o estado do serviço **Microsoft Azure AD Sync**.
    *   Caso não esteja em execução, inicie-o manualmente e verifique o Event Viewer (`System Log`) por eventos de *Kernel-Power* ou *Netlogon*.
3. **Validação de Sincronização:**
    *   Abra o **Synchronization Service Manager** no DC02.
    *   Verifique se as operações (`Delta Import`, `Delta Synchronization`, `Export`) retornam o status **"success"**.
    *   Execute o comando no PowerShell para forçar a verificação do scheduler: `Get-ADSyncScheduler`.

## 🔄 Resolução de Problemas Comuns
* **Erro de "Non-genuine toner" ou similar:** Verificar se o hardware host não está bloqueando o acesso aos discos.
* **Erro "Event ID 41 (Kernel-Power)":** Comum em restores após falhas abruptas. Verificar a integridade do sistema de arquivos após o boot.
* **Falha na Sincronização AAD:** Se o serviço falhar, execute `Start-ADSyncSyncCycle -PolicyType Delta`.

## 📅 Histórico de Versão
| Data | Versão | Autor | Notas |
| :--- | :--- | :--- | :--- |
| 16/07/2026 | 1.0 | [Seu Nome] | Criação do SOP baseado na PoC do DC02 |