
# Estrutura do projeto

O projeto está dividido em uma API REST versionada com suporte a OAuth2 e um frontend AngularJS. 

## Instalação

Para facilitar a configuração do ambiente criei um docker-compose. A aplicação encontrasse dividida em 3 containers: 

1. Nginx - Servindo os estatiscos e redirecionando todas as requests do subdominio /api para o container da API
1. Postgres - Banco rodando na porta 5433 
1. App_Server - Ruby 2.4 rodando um servidor Puma

Para rodar a aplicação basta executar as seguintes linhas de comando dentro da raiz do projeto e a aplicação estará disponível em localhost:80 :

1.`sudo docker-compose up --build 
1. sudo docker exec desafioprogramacao1_app_server_1 rake db:create
1. sudo docker exec desafioprogramacao1_app_server_1 rake db:migrate
1. sudo docker exec desafioprogramacao1_app_server_1 rake db:seed

Caso ainda não tenha o docker e o docker-compose instalados basta seguir os links abaixo:

1. https://www.docker.com/community-edition
1. https://docs.docker.com/compose/install/
`

Endpoints API

     POST  |  /api/oauth/authorize(.json)           |      |  OAuth 2.0 Authorization Endpoint        
     POST  |  /api/oauth/token(.json)               |      |  OAuth 2.0 Token Endpoint                
     POST  |  /api/oauth/revoke(.json)              |      |  OAuth 2.0 Token Revocation              
      GET  |  /api/swagger_doc(.:format)            |      |                                          
      GET  |  /api/swagger_doc/:name(.:format)      |      |                                          
      GET  |  /api(.json)                           |      |  Root action                             
     POST  |  /api/:version/sells/mass_edit(.json)  |  v1  |  Create sells from tab file              
     POST  |  /api/:version/users(.json)            |  v1  |  Create user                             
      GET  |  /api/:version/me(.json)               |  v1  |  Information about current resource owner
      
Stack backend: **Grape, Grape::OAuth2, Grape::Entity, ActiveRecord 5, Puma, PostgreSQL, Dotenv, Rack::Cors, Rubocop, RSpec**.

Stack frontend:  **Angular, Angular-Route, Angular-Oauth2** 
 
--------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
# Desafio de programação 1
A idéia deste desafio é nos permitir avaliar melhor as habilidades de candidatos à vagas de programador, de vários níveis.

Este desafio deve ser feito por você em sua casa. Gaste o tempo que você quiser, porém normalmente você não deve precisar de mais do que algumas horas.

## Instruções de entrega do desafio
1. Primeiro, faça um fork deste projeto para sua conta no Github (crie uma se você não possuir).
1. Em seguida, implemente o projeto tal qual descrito abaixo, em seu próprio fork.
1. Por fim, empurre todas as suas alterações para o seu fork no Github e envie um pull request para este repositório original. Se você já entrou em contato com alguém da Myfreecomm sobre uma vaga, avise também essa pessoa por email, incluindo no email o seu usuário no Github.

## Instruções alternativas de entrega do desafio (caso você não queira que sua submissão seja pública)
1. Faça um clone deste repositório.
1. Em seguida, implemente o projeto tal qual descrito abaixo, em seu clone local.
1. Por fim, envie via email um arquivo patch para seu contato na Myfreecomm.

## Descrição do projeto
Você recebeu um arquivo de texto com os dados de vendas da empresa. Precisamos criar uma maneira para que estes dados sejam importados para um banco de dados.

Sua tarefa é criar uma interface web que aceite upload de arquivos, normalize os dados e armazene-os em um banco de dados relacional.

Sua aplicação web DEVE:

1. Aceitar (via um formulário) o upload de arquivos separados por TAB com as seguintes colunas: purchaser name, item description, item price, purchase count, merchant address, merchant name. Você pode assumir que as colunas estarão sempre nesta ordem, que sempre haverá dados em cada coluna, e que sempre haverá uma linha de cabeçalho. Um arquivo de exemplo chamado example_input.tab está incluído neste repositório.
1. Interpretar ("parsear") o arquivo recebido, normalizar os dados, e salvar corretamente a informação em um banco de dados relacional.
1. Exibir a receita bruta total representada pelo arquivo enviado após o upload + parser.
1. Ser escrita obrigatoriamente em Ruby 2.0+ ou Python 2.7+ (caso esteja entrevistando para uma vaga específica, utilize a linguagem solicitada pela vaga).
1. Ser simples de configurar e rodar, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres ou gratuitas.

Sua aplicação web não precisa:

1. Lidar com autenticação ou autorização (pontos extras se ela fizer, mais pontos extras se a autenticação for feita via OAuth).
1. Ser escrita usando algum framework específico (mas não há nada errado em usá-los também, use o que achar melhor).
1. Ter uma aparência bonita.

## Avaliação
Seu projeto será avaliado de acordo com os seguintes critérios. 

1. Sua aplicação preenche os requerimentos básicos?
1. Você documentou a maneira de configurar o ambiente e rodar sua aplicação?
1. Você seguiu as instruções de envio do desafio?

Adicionalmente, tentaremos verificar a sua familiarização com as bibliotecas padrões (standard libs), bem como sua experiência com programação orientada a objetos a partir da estrutura de seu projeto.

### Referência

Este desafio foi baseado neste outro desafio: https://github.com/lschallenges/data-engineering
