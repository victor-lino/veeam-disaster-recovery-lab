# Configuração de Repositórios de Backup

Este documento detalha a estrutura de armazenamento utilizada pelo Veeam Backup & Replication para a retenção dos dados protegidos.

## Repositório Principal
O armazenamento está centralizado no dispositivo externo mapeado pelo sistema operacional.

- Nome do Repositório: External HDD Repository
- Tipo de Repositório: Windows Server (Local Storage)
- Caminho de Destino: G:\VeeamBackup
- Sistema de Arquivos: NTFS
- Configuração de Performance: Otimizado para infraestrutura local (LAN).

## Parâmetros de Armazenamento
As definições abaixo garantem que o Veeam gerencie o espaço em disco de forma eficiente:

1. Alinhamento de dados: Otimizado para blocos de tamanho padrão.
2. Compressão: Nível de compressão configurado como Optimal para equilibrar o uso de CPU do host com o tamanho final dos arquivos de backup.
3. Desduplicação: Habilitada para reduzir a redundância de dados dentro das máquinas virtuais e arquivos.
4. Manutenção: Realizada verificação de integridade dos arquivos (Active Full ou Synthetic Full) agendada semanalmente.

## Considerações de Hardware
A performance de escrita é limitada pela interface do HD Externo (USB 3.0/3.1). Monitorar gargalos de I/O é essencial durante o processamento de backups Full.