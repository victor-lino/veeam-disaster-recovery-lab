# Monitoramento e Observabilidade

Esta pasta contém os arquivos de configuração necessários para replicar o ambiente de monitoramento do Veeam Backup & Replication.

## Arquivos de Configuração

- `zabbix-veeam-template.xml`: Template customizado para o Zabbix. Este arquivo contém as regras de descoberta (LLD), protótipos de itens e protótipos de triggers necessárias para monitorar os jobs de backup, status de serviços e uso de storage.
- `grafana-veeam-dashboard.json`: Arquivo de exportação do dashboard. Este JSON inclui toda a estrutura de painéis, consultas de dados (queries) e configurações visuais criadas no Grafana.

## Instruções de Importação

### Zabbix
1. Acesse o Zabbix Frontend.
2. Navegue até Data collection > Templates.
3. Clique em Import.
4. Selecione o arquivo `zabbix-veeam-template.xml` e conclua a importação.
5. Associe o template aos hosts de backup conforme a topologia.

### Grafana
1. Acesse o Grafana.
2. Navegue até Dashboards > Import.
3. Selecione o arquivo `grafana-veeam-dashboard.json`.
4. Selecione o Data Source do Zabbix configurado em seu ambiente.
5. Clique em Import.

## Notas de Compatibilidade
- O template foi desenvolvido para ser utilizado com o Zabbix Agent (ativo).
- O dashboard assume que as métricas coletadas seguem as chaves (keys) definidas nas regras de descoberta do template.
- Ajustes de permissão de API no Zabbix podem ser necessários dependendo da versão utilizada.