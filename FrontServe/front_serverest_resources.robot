*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                    https://front.serverest.dev/login
${BTNCADASDTRO}           //a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${CDNOME}                 nome                              
${CDPASSWORD}             password    
${CDEMAIL}                email
               
*** Keywords ***

Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window
    
Fechar o navegador
    Close Browser
Dado que eu esteja no site "front.serverest"
    Go To    url=${URL}
    Title Should Be    Front - ServeRest
    Capture Page Screenshot             Site_Front_Severest.png 


Quando clico na opcao cadastro
    Page Should Contain Element          ${BTNCADASDTRO}
    Click Element                        ${BTNCADASDTRO}
    Capture Page Screenshot              Tela_De_Cadastro.png 
    
    
Entao efetuo o cadastro
    Page Should Contain Element          ${CDNOME}     
    Input Text                           ${CDNOME}  Weslley Rodrigues da Silva
    Capture Page Screenshot              Nome_Usuario.png

  

   



    

