# Prova de Conceito e Validacao

Este documento descreve os testes realizados para validar a resiliencia da infraestrutura.

## Roteiro de Validacao (PoC)

1. Teste de Restauracao (Restore):
    - Execucao de "Entire VM Restore" do DC02 para um disco dedicado.
    - Boot da maquina restaurada em ambiente isolado.
    - Confirmacao de acesso ao Active Directory e servicos de rede.

2. Validacao de Sincronizacao:
    - Execucao de ciclo Delta de sincronizacao com o Microsoft Azure AD Connect.
    - Verificacao de sucesso nas operacoes de "Export" e "Import" no console de gerenciamento.

3. Monitoramento:
    - Confirmacao de que o dashboard no Grafana reflete corretamente o status dos jobs apos os testes de restauracao.

## Evidencias
- Logs de sucesso no console do Veeam (verificar arquivos em /images).
- Status "Success" nos perfis de sincronizacao do Azure AD Connect (verificar arquivos em /images).