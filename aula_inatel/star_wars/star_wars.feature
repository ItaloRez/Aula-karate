Feature: Testando API Star Wars

Scenario: Testando retorno de people/1.
        Given url "https://swapi.co/api/people/1/"
        When method get
        Then status 200

Scenario: Testando retorno people/1 com informações inválidas.
        Given url "https://swapi.co/api/people/1/1234"
        When method get
        Then status 404