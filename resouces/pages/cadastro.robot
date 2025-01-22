*** Settings ***
Resource    ../main.robot


*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${CAMPO_CARD}    id:form-botao
@{selecionar_setor}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]



*** Keywords ***
Preeechimento do Formulario
    ${Nome}       FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}    ${Nome}
    ${Cargo}      FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}   ${Cargo} 
    ${Imagem}     fakerLibrary.Image Url   width=100    height=100
    Input Text    ${CAMPO_IMAGEM}    ${Imagem} 
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_setor}[0]
Clicar em Criar Card
    Click Element    ${BOTAO_CARD}
Verificar Card Criado
    Sleep    5s
    Element Should Be Visible   class:colaborador

Verificar Mais de Um Card Criado
    FOR    ${i}    IN RANGE    1    3
        Preeechimento do Formulario
        Clicar em Criar Card
    END
    Sleep    10s


Criar Para Cada Setor
    FOR    ${indice}    ${setores}    IN ENUMERATE    @{selecionar_setor} 
        Preeechimento do Formulario
        Click Element    ${setores}
        Sleep    3s
        Clicar em Criar Card

    END

Clicar no botão cadastrar sem preecher os campos
    Click Element    ${CAMPO_CARD}
Verificar Mensagem de Erro
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
    