# Estratégia de Backup e Retenção

Este documento define os parâmetros de retenção e as políticas aplicadas aos jobs de backup no Veeam Backup & Replication.

## Políticas de Retenção

A política aplicada visa garantir a recuperação granular de dados com um balanço entre disponibilidade e consumo de espaço em disco nos repositórios.

| Job | Tipo de Backup | Política de Retenção | Frequência |
| :--- | :--- | :--- | :--- |
| DC01 / DC02 | Incremental Forever | 14 Pontos de Restauração | Diária |
| Linux Server | Incremental Forever | 14 Pontos de Restauração | Diária |
| pfSense | File Backup | 7 Pontos de Restauração | Diária |
| Bare Metal (DC03) | Volume Level | 14 Pontos de Restauração | Diária |

## Definições Técnicas

1. Método de Backup: Utilizado o formato Incremental Forever para otimização de largura de banda e espaço no storage.
2. Target: Todos os jobs estão configurados para escrever dados no `External HDD Repository`.
3. Validação: A integridade dos arquivos de backup é verificada periodicamente através de jobs de rotina do próprio Veeam.
4. SLA de Recovery: O tempo de recuperação (RTO) está condicionado à performance de leitura do storage de destino e à latência da interface de rede do host.

## Considerações de Segurança

- Os arquivos de backup não possuem criptografia ativada nesta versão de laboratório.
- Os repositórios de backup possuem permissões de sistema configuradas para restringir o acesso apenas à conta de serviço do Veeam.