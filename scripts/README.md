# Scripts de Automação e Validação

Esta pasta contém os scripts utilizados para automatizar a verificação de integridade e validar os serviços após operações de recuperação de desastres (Disaster Recovery).

## Scripts Disponíveis

- `Validate-ADSync.ps1`: Script em PowerShell para validação pós-restore do Domain Controller.
    - Função: Testa conectividade, verifica o estado do serviço do Azure AD Connect e força a sincronização Delta.
    - Pré-requisitos: Executar com privilégios de Administrador no servidor onde o Azure AD Connect está instalado.

## Como utilizar

Para executar o script de validação, abra o PowerShell como Administrador no servidor alvo e execute o seguinte comando:

```powershell
.\Validate-ADSync.ps1