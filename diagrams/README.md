\# Diagramas da Arquitetura



Esta pasta contém as representações visuais da infraestrutura de backup e monitoramento.



\## Estrutura dos Arquivos



\- `network-topology.png`: Representação do fluxo de rede entre os hosts, repositórios de backup e o servidor de monitoramento Zabbix/Grafana.

\- `backup-flow.png`: Detalhamento dos caminhos de dados dos agentes (Windows, Linux, Bare Metal) até o repositório externo de backup.



\## Descrição da Arquitetura



A topologia foi desenhada para garantir a segregação entre tráfego de produção e tráfego de backup.



1\. Camada de Proteção: Composta pelos agentes do Veeam rodando em cada host.

2\. Camada de Repositório: Armazenamento físico (SATA HDDs e HD Externo) dedicado exclusivamente ao Veeam.

3\. Camada de Observabilidade: Integração via Zabbix Agent (Ativo) enviando métricas para o Zabbix Server, com visualização de dados consolidada via Grafana.



Os diagramas utilizam o padrão de cores para distinguir fluxos de dados de rede, tráfego de backup e chamadas de monitoramento.

