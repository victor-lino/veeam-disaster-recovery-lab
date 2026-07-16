# 🛡️ Disaster Recovery & Observability: Veeam + Zabbix + Grafana 
*For the Portuguese version, please read [README-PT.md](README-PT.md).* 
 
## 📋 Overview 
This project documents the implementation of the data protection and resiliency layer of my corporate Home Lab. The main goal was to establish robust backup routines, ensure Disaster Recovery for critical services (such as Active Directory), and fully integrate the operation into the monitoring system (Zabbix/Grafana) using custom templates. 
 
## 🏗️ Current Architecture 
* **Backup Engine:** Veeam Backup & Replication Community Edition. 
* **Domain Controllers:** DC01 and DC02 (Hybrid AD Environment). 
* **Observability Stack:** Zabbix Server and Grafana (Ubuntu). 
* **Edge Security:** pfSense Firewall. 
 
## 🚀 Key Highlights & PoC 
1. **Custom Observability:** Developed tailored Zabbix templates to extract Veeam metrics (Jobs, Storage, Services) and visualize them in real-time through a centralized Grafana dashboard. 
2. **Disaster Recovery Proof of Concept:** Successfully simulated a catastrophic failure on DC02. Executed a full disk export/restore via Veeam and validated the Microsoft Azure AD Connect synchronization post-recovery. 
 
## 🗺️ Future Roadmap 
- [x] Veeam Backup & Replication deployment 
- [ ] TrueNAS (Storage + iSCSI) implementation 
- [ ] Windows Failover Cluster & Hyper-V Cluster 
- [ ] Active Directory Certificate Services (PKI) 
- [ ] DFS Namespace + DFS Replication 
- [ ] VMware ESXi + vCenter testing 
 