# Projeto de Teste com Maven e Karate

## Descrição

Este projeto é um exemplo de automação de testes utilizando Maven e Karate para testar a API fornecida pela freefakeapi.io. O objetivo é demonstrar como realizar testes automatizados de API usando o Karate.

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas no seu ambiente de desenvolvimento:

- JDK (Java Development Kit)
- Maven

## Configuração do Projeto

1. Clone o repositório do projeto em seu ambiente local.
2. Navegue até o diretório raiz do projeto.

## Executando os Testes

Para executar os testes, utilize o seguinte comando:

```shell
mvn test -Dtest=FakeAPIRunner
```

Este comando irá executar o runner `FakeAPIRunner`, que é responsável por executar os testes definidos para a API fake fornecida pela freefakeapi.io.

## Estrutura do Projeto

```
├── src
│   ├── test
│   │   ├── java
│   │   │   └── aula_inatel
│   │   │       └── free_fake_API
│   │   │           └── FakeAPIRunner.java
│   │   │           └── free_fake_API.feature
│   │   └── resources
│   │       └── karate-config.js
│   └── pom.xml
└── README.md
```

A estrutura do projeto segue a convenção padrão do Maven. Os arquivos de teste em Karate estão localizados no diretório `src/test/java/aula_inatel/free_fake_API`, onde você pode adicionar mais arquivos de teste e cenários à medida que necessário. O arquivo de configuração do Karate (`karate-config.js`) está localizado no diretório `src/test/resources`.

## Documentação Adicional

Para obter mais informações sobre o Karate, consulte a documentação oficial em [https://github.com/intuit/karate](https://github.com/intuit/karate).

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
