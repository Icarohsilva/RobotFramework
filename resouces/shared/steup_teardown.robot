*** Settings ***
Resource    ../main.robot

*** Variables ***

*** Keywords ***
Acesso ao site
    Open Browser    http://localhost:3000/    browser=Chrome

Fechar Navegador
    Close Browser
