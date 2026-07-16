# Security Policy 
 
## Supported Versions 
Este repositório é destinado exclusivamente para fins de estudo e documentação de Home Lab (PoC). Os scripts e configurações fornecidos foram testados nas seguintes versões: 
 
| Componente | Versão Suportada | 
| ---------- | ---------------- | 
| Veeam Backup & Replication | Community Edition (12.x) | 
| Zabbix Server | 7.0 LTS / 6.4 | 
| Grafana | 10.x / 11.x | 
| Windows Server | 2022 / 2025 | 
 
## Reporting a Vulnerability 
Como este é um ambiente de laboratório isolado, não há dados sensíveis, chaves de API reais ou credenciais de produção expostas.  
 
**Regras de Segurança deste Repositório:** 
1. **Nenhum arquivo de disco ou backup (`.vmdk`, `.vhdx`, `.vbk`) será carregado neste repositório.** 
2. Todos os endereços IPs documentados (ex: `192.168.x.x`, `10.8.x.x`) pertencem a redes privadas (RFC 1918) sem roteamento externo. 
3. Senhas e tokens presentes em scripts de exemplo foram higienizados e substituídos por variáveis fictícias (ex: `YOUR_PASSWORD_HERE`). 
 
Se você encontrar alguma credencial real esquecida nos logs ou scripts de validação, por favor, abra uma *Issue* imediatamente sinalizando o arquivo.