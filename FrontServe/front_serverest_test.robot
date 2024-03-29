*** Settings ***
Documentation     Essa suíte testes o site da https://front.serverest.dev/             
Resource            front_serverest_resources.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Cadastro com Usuário válido   
    [Documentation]  Esse teste valida o cadastro no site do https://front.serverest.dev/
    ...              com usuários validos 
    [Tags]           Cadastro
    Dado que eu esteja no site "front.serverest"
    Quando clico na opcao Cadastro
    Entao efetuo o cadastro

Caso de Teste 02 - Login com Usuário válido
    [Documentation]   Esse teste valida o login no site do https://front.serverest.dev/
    ...               com usuários valido
    [Tags]            Login
    Dado que eu esteja no site "front.serverest"
    Quando efetuo o login com usuário válido
    Entao devo ser redirecionado para a pagina de produtos

Caso de Teste 03 - Login com Usuário inválido
    [Documentation]   Esse teste valida o login no site do https://front.serverest.dev/
    ...               com usuários invalidos
    [Tags]            Login  
    Dado que eu esteja no site "front.serverest"
    Quando efetuo o login com usuário inválido
    Entao uma mensagem de erro deve ser exibida