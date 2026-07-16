# Topologia de Storage e Hardware (Home Lab)

A resiliencia de uma estrategia de Disaster Recovery comeca na base de hardware. Este ambiente foi projetado utilizando o conceito de Storage Tiering em um host portátil (notebook), garantindo performance para as máquinas virtuais e redundância de backups.

## Especificacoes do Host Fisico
O ambiente roda sobre uma arquitetura de notebook dedicada a laboratório:
* Processador: Intel Core i3 (11ª Geração)
* Memória: 16 GB RAM
* Armazenamento Interno: 1x NVMe Adata (480 GB) + 1x SSD SATA (240 GB)

## Estrutura de Discos (Storage Tiering)

A infraestrutura utiliza o armazenamento interno para performance e dispositivos externos para isolamento de backups:

### Tier 1: Performance (Datastore das VMs)
* Disco: NVMe Adata (480 GB)
* Funcao: Hospedar o Virtual Disk (VMDK/VHDX) das VMs de missao critica (DC01, DC02, Zabbix e pfSense).

### Tier 2: Capacity & Backup (Veeam Repositories)
* Disco Interno: SSD SATA (240 GB)
* Discos Externos: SSD Externo (240 GB) e HD Externo (1 TB)
* Funcao: Configurados como Backup Repositories no Veeam.
* Fluxo: O Veeam processa os dados do NVMe (Tier 1) e escreve os arquivos de backup diretamente no SSD e HD externos. Isso garante que, em caso de falha do host físico, os dados de backup estejam isolados em mídias externas.

## Politicas de Backup (Jobs)
O Veeam esta configurado com Jobs individuais apontando para os repositorios externos:
1. Job Linux Server (Zabbix/Grafana)
2. Job DC01 (Active Directory)
3. Job DC02 (Azure AD Sync)
4. Job DC03 (Windows Agent Backup - Bare Metal Host)
5. Job pfSense (File Backup)