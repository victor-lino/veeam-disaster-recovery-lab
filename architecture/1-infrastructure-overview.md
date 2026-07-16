# 🗺️ Visão Geral da Infraestrutura (IPAM & Roles) 
 
Este documento detalha a topologia de rede e a atribuição de endereços IP (IPAM) dos servidores e serviços que compõem o laboratório protegido pelo Veeam Backup & Replication. 
 
## 🌐 Segmentação de Rede 
Todo o ambiente interno de laboratório opera sob o range `192.168.244.0/24`, isolado da rede doméstica (WAN) através do firewall pfSense, garantindo simulação fiel de uma LAN corporativa. 
 
## 🖥️ Servidores e Endereçamento 
 
| Hostname / Serviço | Endereço IP (LAN) | Sistema Operacional | Função / Role Principal | 
| :--- | :--- | :--- | :--- | 
| **pfSense-FW** | `192.168.244.1` | FreeBSD | Edge Firewall, Roteamento, DNS, DHCP | 
| **DC03-Physical** | `192.168.244.10` | Windows Server / 11 | Servidor Físico (Bare Metal) / Management | 
| **Zabbix-Server** | `192.168.244.128` | Linux Ubuntu 24.04 | Monitoramento Central, Zabbix Server, Grafana | 
| **DC01** | `192.168.244.129` | Windows Server 2025 | Primary Domain Controller, AD DS, DNS | 
| **DC02** | `192.168.244.130` | Windows Server 2025 | Secondary Domain Controller, Azure AD Sync | 
| **Veeam-BR** | `localhost / Agent`| Windows | Veeam Backup & Replication Server | 
 
## 🔗 Integrações de Serviço 
* **Active Directory Híbrido:** O DC02 é o responsável por manter o `Microsoft Azure AD Sync` rodando e sincronizando objetos locais com a nuvem (Entra ID). 
* **Monitoramento (Agentes):** Todos os nós (exceto pfSense) enviam telemetria ativa (Porta `10050`) para o Zabbix Server. O pfSense é monitorado via SNMP (Porta `161`). 
