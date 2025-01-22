*** Settings ***
Resource    ../resouces/main.robot
Test Setup    Acesso ao site
Test Teardown    Fechar Navegador

*** Test Cases ***
Preenchiento de Campos do Formulario e Cadastro de Novo Card
    Preeechimento do Formulario
    Clicar em Criar Card
    Verificar Card Criado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Preeechimento do Formulario
    Clicar em Criar Card
    Verificar Mais de Um Card Criado


Verificar cadastro de Cards em Varios Setores
    Preeechimento do Formulario
    Criar Para Cada Setor

