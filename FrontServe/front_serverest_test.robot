*** Settings ***
Documentation     Essa suíte testes o site da https://front.serverest.dev/             
Resource            front_serverest_resources.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Cadastro com Usuário validos   
    [Documentation]  Esse teste valida o login no site do https://front.serverest.dev/
    ...              com usuários validos 
    [Tags]           login
    Dado que eu esteja no site "front.serverest"
    Quando clico na opcao Cadastro
    Entao efetuo o cadastro