Feature: Testando resources da API FreeFakeAPI.io

Background: Executa uma vez antes de cada teste
    * def url_base = 'https://freefakeapi.io/api'
    * def request_json = read('json.json')
    * def erro_json = read('erro.json')
    
Scenario: Listar todos os usuários
    Given url url_base
    And path '/users'
    When method get
    Then status 200
    And match $ == '#[]'
    And match $ == '#[10]'
    And match each $ contains { username: '#string', id: '#string'}

Scenario: Listar um usuário específico
    Given url url_base
    And path '/users/1'
    When method get
    Then status 200
    And match $ == '#object'
    And match $ contains { username: '#string', id: '#string'}
    And match $ contains { id: '1', username: 'MikePayne'}

Scenario: Listar todos os posts
    Given url url_base
    And path '/posts'
    When method get
    Then status 200
    And match $ == '#[]'
    And match $ == '#[16]'
    And match each $ contains { id: '#string', title: '#string', user: '#string'}

Scenario: Listar um post específico
    Given url url_base
    And path '/posts/1'
    When method get
    Then status 200
    And match $ == '#object'
    And match $ contains { id: '#string', title: '#string', user: '#string'}
    And match $ contains { id: '1', title: 'Let me explain', user: '/api/users/1'}

Scenario: Criando um post
    Given url url_base
    And path '/posts'
    And request request_json
    When method post
    Then status 201
    And match $ == '#object'
    And match $ contains { id: '#number', title: '#string', user: '#string'}
    And match $ contains { title: 'This is the title', user: '/api/users/5'}

Scenario: Criando um post com erro
    Given url url_base
    And path '/posts'
    And request erro_json
    When method post
    Then status 400
    And match $ == '#object'
    And match $ contains { message: '#string'}
    And match $ contains { message: 'Incomplete data'}

Scenario: Atualizando um post sem passar o id
    Given url url_base
    And path '/posts'
    And request request_json
    When method put
    Then status 400
    And match $ == '#object'
    And match $ contains { message: '#string'}
    And match $ contains { message: 'Incomplete data, all resource data must be in request body'}