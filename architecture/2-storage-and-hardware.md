# 💾 Topologia de Storage e Hardware (Home Lab) 
 
A resiliência de uma estratégia de Disaster Recovery começa na base de hardware. Este ambiente foi projetado utilizando o conceito de **Storage Tiering**, garantindo performance (I/O) para as máquinas virtuais e capacidade segura para a retenção dos backups. 
 
## ⚙️ Especificações do Host Físico (Hypervisor/Bare Metal) 
O ambiente roda sobre uma arquitetura robusta para suportar múltiplas VMs, banco de dados do Zabbix e processos de desduplicação do Veeam simultaneamente: 
* **Placa-mãe:** ASUS TUF Gaming B550M 
* **Processador:** AMD Ryzen 7 5700X3D 
* **Vídeo:** NVIDIA RTX 2070 Super 
 
## 🗄️ Estrutura de Discos (Storage Tiering) 
 
A infraestrutura conta com 1 drive NVMe para performance e um array de 4 discos SATA HDDs + armazenamento externo, divididos da seguinte forma: 
 
### Tier 1: Performance (Datastore das VMs) 
* **Disco:** NVMe Drive 
* **Função:** Hospedar o Virtual Disk (VMDK/VHDX) dos servidores de missão crítica (DC01, DC02, Zabbix e pfSense).  
* **Justificativa:** Garantir baixo tempo de resposta (latência) para o banco de dados do Zabbix e consultas de autenticação do Active Directory. 
 
### Tier 2: Capacity & Backup (Veeam Repositories) 
* **Discos Internos:** 4x SATA HDDs 
* **Disco Externo:** HD Externo (Mapeado como Unidade `G:`) 
* **Função:** Configurados como *Backup Repositories* no Veeam. 
* **Fluxo:** O Veeam processa os dados do NVMe (Tier 1) e escreve os arquivos de backup `.vbk` (Full) e `.vib` (Incremental) diretamente no array SATA e no HD Externo (Target). Isso garante que, em caso de falha catastrófica do NVMe principal, os dados de backup estejam isolados fisicamente em outras mídias. 
 
## 🛡️ Políticas de Backup (Jobs) 
O Veeam está configurado com Jobs individuais apontando para o Repositório Externo: 
1. `Job Linux Server` (Zabbix/Grafana) 
2. `Job DC01` (Active Directory) 
3. `Job DC02` (Azure AD Sync) 
4. `Job DC03` (Windows Agent Backup - Bare Metal) 
5. `Job pfSense` (File Backup) 
 