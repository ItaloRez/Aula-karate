Feature: Testando API Pokemon

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Testando retorno.
    Given url 'https://pokeapi.co/api/v2/pokemon/pikachu'
    When method get
    Then status 200

Scenario: Testando retorn people/1/ com informações invalidas.
    Given url 'https://pokeapi.co/api/v2/pokemon/chocolate'
    When method get
    Then status 404

Scenario: Testando retorno do pikachu e verificando JSON
    Given url url_base
    And path 'pokemon/pikachu'
    When method get
    Then status 200
    And match response.name == 'pikachu'
    And match response.id == 25

Scenario: Testando retorno do pokemon Red entrando em um dos elementos do array de idiomas e testando retorno do JSON
    Given url url_base
    And path 'version/1'
    When method get
    Then status 200
    And def idioma = $.names[5].language.url
    And url idioma
    When method get
    Then status 200
    And match response.name == 'es'
    And match response.id == 7

Scenario: Testando retorno do pokemon Ditto e verificando o array de lugares que ele pode ser encontrado
    Given url url_base
    And path 'pokemon/ditto'
    When method get
    Then status 200
    And match response.name == 'ditto'
    And match response.id == 132
    And def local = $.location_area_encounters
    And url local
    When method get
    Then status 200
    And match response[0].location_area.name == 'sinnoh-route-218-area'

Scenario: Testando retorno do pokemon Charizard e verificando o array de habilidades
    Given url url_base
    And path 'pokemon/charizard'
    When method get
    Then status 200
    And match response.name == 'charizard'
    And match response.id == 6
    And def habilidades = $.abilities[0].ability.url
    And url habilidades
    When method get
    Then status 200
    And match response.name == 'blaze'
    And match response.id == 66