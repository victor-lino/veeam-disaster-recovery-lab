# Objetivos de Recuperação

Este documento estabelece as metas de disponibilidade de dados e tolerância a perdas para o laboratório de infraestrutura.

## RPO (Recovery Point Objective)
O RPO definido para este ambiente é de 24 horas. Isto significa que a política de backup garante que, em um cenário de falha catastrófica, a perda máxima de dados permitida é equivalente ao período de um dia de trabalho. As rotinas de backup são executadas diariamente para manter esta meta.

## RTO (Recovery Time Objective)
O RTO varia de acordo com a criticidade do ativo:

| Ativo | Prioridade | RTO Estimado |
| :--- | :--- | :--- |
| Domain Controllers (DC01/DC02) | Crítica | 2 a 4 horas |
| Monitoramento (Zabbix/Grafana) | Média | 4 a 6 horas |
| Firewall (pfSense) | Alta | 1 a 2 horas |
| Bare Metal Host (DC03) | Média | 6 a 8 horas |

## Premissas de Recuperação
1. A restauração depende da disponibilidade de energia e conectividade do host físico.
2. A integridade dos repositórios de backup externos é vital para o cumprimento dos prazos de RTO.
3. Testes de restauração devem ser realizados periodicamente para validar que os dados estão consistentes.