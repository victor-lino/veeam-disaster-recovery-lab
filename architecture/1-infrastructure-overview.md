# Visao Geral da Infraestrutura (IPAM & Roles)

Este documento detalha a topologia de rede e a atribuicao de endereços IP (IPAM) dos servidores e servicos que compoem o laboratorio.

## Segmentacao de Rede
Todo o ambiente de laboratorio opera sob o range 192.168.244.0/24, isolado da rede domestica (WAN) atraves do firewall pfSense, garantindo simulacao fiel de uma LAN corporativa.

## Servidores e Enderecamento

| Hostname / Servico | Endereco IP (LAN) | Sistema Operacional | Funcao / Role Principal |
| :--- | :--- | :--- | :--- |
| pfSense-FW | 192.168.244.1 | FreeBSD | Edge Firewall, Roteamento, DNS, DHCP |
| DC03-Physical | 192.168.244.10 | Windows 11 | Host Principal (Notebook) / Management |
| Zabbix-Server | 192.168.244.128 | Linux Ubuntu 24.04 | Monitoramento Central, Zabbix, Grafana |
| DC01 | 192.168.244.129 | Windows Server 2025 | Primary Domain Controller, AD DS, DNS |
| DC02 | 192.168.244.130 | Windows Server 2025 | Secondary Domain Controller, Azure AD Sync |
| Veeam-BR | localhost / Agent| Windows | Veeam Backup & Replication Server |

## Integracoes de Servico
* Active Directory Hibrido: O DC02 e o responsavel por manter o Microsoft Azure AD Sync rodando e sincronizando objetos locais com a nuvem (Entra ID).
* Monitoramento (Agentes): Todos os nos (exceto pfSense) enviam telemetria ativa (Porta 10050) para o Zabbix Server. O pfSense e monitorado via SNMP (Porta 161).