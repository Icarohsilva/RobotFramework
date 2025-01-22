*** Settings ***
Resource    ../resouces/main.robot
Test Setup       Acesso ao site
Test Teardown    Fechar Navegador

*** Variables ***


*** Test Cases ***
Verificar mensagem de preechimento icnorreto do campo
    Clicar no botão cadastrar sem preecher os campos
    Verificar Mensagem de Erro
    
