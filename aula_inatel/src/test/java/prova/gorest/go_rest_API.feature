Feature: Testando resources da API gorest.co.in

Background: Executa uma vez antes de cada teste
    * def url_base = 'https://gorest.co.in/public/v2'
    * def token = 'dfe053641d0e64bfdce4f5eed43cb3a920f3edb9a553860b5dc07880aa32c6b6'
    * def user_json = read('user_json.json')
    
Scenario: Listar todos os usuários
    Given url url_base
    And path '/users'
    When method get
    Then status 200
    And match $ == '#[]'
    And match $ == '#[10]'
    And match each $ contains { name: '#string', id: '#number'}

Scenario: Listar um usuário específico
    Given url url_base
    And path '/users/3270087'
    When method get
    Then status 200
    And match $ == '#object'
    And match $ contains { name: '#string', id: '#number'}
    And match $ contains { id: 3270087, name: 'Miss Ranjeet Varrier'}

Scenario: Listar todos os posts
    Given url url_base
    And path '/posts'
    When method get
    Then status 200
    And match $ == '#[]'
    And match $ == '#[10]'
    And match each $ contains { id: '#number', title: '#string', user_id: '#number'}

Scenario: Listar um post específico
    Given url url_base
    And path '/posts/47647'
    When method get
    Then status 200
    And match $ == '#object'
    And match $ contains { id: '#number', title: '#string', user_id: '#number'}
    And match $ contains { id: 47647, title: 'Temperantia supellex contigo carmen caveo aspernatur baiulus degenero.', user_id: 3270096}

Scenario: Criando um usuário
    Given url url_base
    And path '/users'
    And param access-token = token
    And request user_json
    When method post
    Then status 201
    And match $ == '#object'
    And match $ contains { id: '#number', name: '#string', gender: '#string'}
    And match $ contains { name: 'teste', gender: 'male'}

Scenario: Criando um usuário com mesmo email
    Given url url_base
    And path '/users'
    And param access-token = token
    And request user_json
    When method post
    Then status 422
    And match $ == '#array'
    And match $ contains { message: '#string' , field: '#string'}
    And match $ contains { message: "has already been taken", field: "email"}
