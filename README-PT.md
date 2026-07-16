# 🛡️ Disaster Recovery & Observabilidade: Veeam Backup + Zabbix + Grafana 
 
## 📋 Visão Geral 
Este projeto documenta a implementação da camada de proteção de dados e resiliência do meu Home Lab corporativo. O foco principal foi criar rotinas de backup robustas, garantir o Disaster Recovery de serviços críticos (como Active Directory) e integrar toda a operação ao sistema de monitoramento (Zabbix/Grafana) através de templates customizados. 
 
## 🏗️ Arquitetura do Ambiente Atual 
* **Backup Server:** Veeam Backup & Replication Community Edition. 
* **Domain Controllers:** DC01 e DC02 (Ambiente Híbrido). 
* **Monitoramento:** Zabbix Server e Grafana (Ubuntu). 
* **Segurança de Borda:** pfSense Firewall. 
* **Físico:** Máquina Host (Bare Metal Backup). 
 
## 🚀 Desafios e Soluções (O Diferencial) 
1. **Monitoramento Integrado:** Desenvolvimento de templates customizados no Zabbix para ler métricas do Veeam via API/Logs, contornando limitações de integração nativa. 
2. **Dashboard Centralizado:** Painel construído no Grafana para exibir status dos Jobs, taxa de transferência, gargalos e capacidade de Storage. 
3. **Disaster Recovery na Prática (PoC):** Simulação de perda total do Domain Controller (DC02) e restauração completa (Export/Restore) via Veeam, validando a sincronização do Microsoft Azure AD Connect pós-incidente. 
 
## 📂 Estrutura do Repositório 
* `/architecture/`: Documentação de IPs, servidores e repositórios. 
* `/diagramas/`: Topologia da rede e fluxo de dados de backup. 
* `/docs/`: Procedimentos Operacionais Padrão (SOP), incluindo o passo a passo do Restore do DC02. 
* `/images/`: Evidências visuais e prints da execução dos jobs. 
* `/monitoring/`: Dashboard do Grafana (`.json`) e template do Zabbix (`.xml`). 
* `/scripts/`: Scripts em PowerShell para automação e validação de serviços pós-restore. 
* `/validation/`: Logs de sucesso e evidências da Prova de Conceito (PoC). 
 
--- 
 
## 🗺️ Roadmap do Home Lab (Próximos Passos) 
A infraestrutura está em constante evolução. Abaixo está a ordem cronológica dos próximos projetos de integração e alta disponibilidade: 
 
- [x] Finalizar Veeam Backup & Replication (Fase Atual) 
- [ ] Implementar TrueNAS (Storage + iSCSI) 
- [ ] Configurar Windows Failover Cluster (utilizando TrueNAS como armazenamento compartilhado) 
- [ ] Implantar Hyper-V Cluster 
- [ ] Configurar Active Directory Certificate Services (PKI) 
- [ ] Implementar DFS Namespace + DFS Replication 
- [ ] Integrar Microsoft Defender for Endpoint/Identity 
- [ ] Expandir Azure Infrastructure (rede, VPN e recuperação) 
- [ ] Migração/Testes com VMware ESXi + vCenter 
- [ ] Automação avançada de rotinas com PowerShell 
 