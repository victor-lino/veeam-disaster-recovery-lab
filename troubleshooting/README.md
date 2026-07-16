# \# Analise de Falhas e Solucoes

# 

# Este documento registra incidentes tecnicos detectados e as solucões aplicadas durante a integracao do ecossistema de backup e monitoramento.

# 

# \## Registro de Ocorrencias

# 

# \### 1. Problemas de Sincronizacao (Azure AD Connect)

# \- Descricao: Inconsistencias no fluxo de dados entre o AD local e o Entra ID apos o processo de restore.

# \- Solucao: Padronizacao do ciclo de sincronizacao via PowerShell (`Start-ADSyncSyncCycle`) e validacao das permissoes de conta de servico (ADSync).

# 

# \### 2. Monitoramento: Compatibilidade Zabbix

# \- Descricao: Falha na descoberta (discovery) de itens e triggers com o template padrão.

# \- Solucao: Desenvolvimento de template customizado com protótipos de itens baseados em filtros específicos da API do Veeam. Correcao da autenticacao de agentes (Empty Response) com ajuste de IP e configuração de ServerActive.

# 

# \### 3. Backup: Redundancia e Loop de Execucao

# \- Descricao: Maquinas entrando em loop de backup e redundancia de jobs.

# \- Solucao: Reconfiguracao das dependencias de Jobs (After \[Job Name]) no Veeam para garantir uma fila linear e evitar concorrência de I/O no storage.

# 

# \### 4. Falhas de Credenciais e Permissões

# \- Descricao: Erros de "Access Denied" ao tentar acessar o repositório externo.

# \- Solucao: Mapeamento de conta de serviço dedicada para o Veeam com privilégios de leitura/escrita restritos à pasta raiz do repositório (NTFS Security Permissions).

# 

# \### 5. Crash do Sistema (Bare Metal)

# \- Descricao: Instabilidade do host físico durante backups full.

# \- Solucao: Analise de logs de evento e ajuste no nível de compressão do Veeam para reduzir o consumo de CPU/I/O, prevenindo o congelamento do sistema durante a indexação de arquivos.

