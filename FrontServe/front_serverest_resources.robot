*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                    https://front.serverest.dev/login
${BTNCADASTRO}            //a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${CDNOME}                 nome                              
${PASSWORD}               password    
${EMAIL}                  email
${EVIDENCIAS}             Evidências
${BTCADASTRAR}            //button[@data-testid='cadastrar'][contains(.,'Cadastrar')]
${BTNENTRAR}              //button[@data-testid='entrar'][contains(.,'Entrar')]
${TELA_PRODUTO}           //h1[contains(.,'Serverest Store')]
${SENHA_INVALIDA}         //div[@class='alert alert-secondary alert-dismissible'][contains(.,'×Email e/ou senha inválidos')]
*** Keywords ***

Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window
    
Fechar o navegador
    Close Browser
Dado que eu esteja no site "front.serverest"
    Go To    url=${URL}
    Title Should Be                     Front - ServeRest
    Capture Page Screenshot             ${EVIDENCIAS}/Evidencia 01 - Site_Front_Severest.png 


Quando clico na opcao cadastro
    Page Should Contain Element          ${BTNCADASTRO}
    Click Element                        ${BTNCADASTRO}
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 02 - Tela_De_Cadastro.png 
    
    
Entao efetuo o cadastro
    Page Should Contain Element          ${CDNOME}     
    Input Text                           ${CDNOME}      QAWSilva
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 03 - Nome_Usuario.png
    Page Should Contain Element          ${EMAIL}  
    Input Text                           ${EMAIL}    cong4776@uorak.com 
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 04 - Email_inserido.png
    Page Should Contain Element          ${PASSWORD}  
    Input Text                           ${PASSWORD}    Ak47007@ 
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 05 - Senha_inserida.png 
    Page Should Contain Element          ${BTCADASTRAR}
    Click Button                         ${BTCADASTRAR} 
    Sleep                                    3
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 06 - Usuário_Cadastrado.png
Quando efetuo o login com usuário válido
    Page Should Contain Element          ${EMAIL}  
    Input Text                           ${EMAIL}    cong4776@uorak.com
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 07 - Email_inserido.png 
    Page Should Contain Element          ${PASSWORD}
    Input Text                           ${PASSWORD}  Ak47007@
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 08 - Senha_inserida.png 
    Click Button                         ${BTNENTRAR}
    Sleep                                   3

Entao devo ser redirecionado para a pagina de produtos
    Page Should Contain Element          ${TELA_PRODUTO} 
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 09 - Usuário_logado.png

Quando efetuo o login com usuário inválido
    Page Should Contain Element          ${EMAIL}  
    Input Text                           ${EMAIL}    qtesasds@gmai.com
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 10 - Email_inserido.png 
    Page Should Contain Element          ${PASSWORD}
    Input Text                           ${PASSWORD}  Ak47007@
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 11 - Senha_inserida.png 
    Click Button                         ${BTNENTRAR}
    Sleep                                   3

Entao uma mensagem de erro deve ser exibida
    Page Should Contain Element          ${SENHA_INVALIDA}
    Capture Page Screenshot              ${EVIDENCIAS}/Evidência 12 - Mensagem_erro.png