# TLSv1.2

O Conselho de Padrões de Segurança da Indústria de Cartões de Pagamento (PCI SSC) [determina](http://blog.pcisecuritystandards.org/migrating-from-ssl-and-early-tls) que **todos os processadores de cartão de crédito devem retirar versões desatualizadas do serviço de TLS conforme o prazo estabelecido pelo PCI.**

Atendendo as especificações, a **Gerencianet** está fazendo a atualização dos protocolos.

## Introdução

Esse repositório contém dicas e instruções para te ajudar a verificar se seu sistema é compatível com certificados TLS 1.2.

Para cada linguagem de programação, existe um guia diferente, para que você descubra se seu sistema é compatível com o TLS 1.2 ou não. Escolha sua linguagem abaixo e veja os requisitos para que tudo funcione perfeitamente.

* [Node](#node)
* [PHP](#php)
* [Python](#python)
* [.NET](#net)
* [Ruby](#ruby)

* * *

## Node

#### Requisitos

- O Node utiliza o OpenSSL instalado no sistema
- O TLSv1.2 exige que a versão mínima do OpenSSL seja a 1.0.1c

#### Verificando a versão do SSL

1. Execute o seguinte comando em seu servidor
    ```
    node -e "console.log(process.versions)"
    ```
2. A versão do seu OpenSSL será exibida na propriedade `openssl`:
    ```
    {
      http_parser: '2.8.0',
      node: '10.15.0',
      v8: '6.8.275.32-node.45',
      uv: '1.23.2',
      zlib: '1.2.11',
      ares: '1.15.0',
      modules: '64',
      nghttp2: '1.34.0',
      napi: '3',
      openssl: '1.1.0j',
      icu: '62.1',
      unicode: '11.0',
      cldr: '33.1',
      tz: '2018e' 
    }
    ```

#### Executando exemplo de Node

1. Baixe o arquivo `tls.js` do nosso [repositório](Node/).
2. Coloque-o em seu servidor, e execute-o com o comando `node tls.js`

    * On success:    
        ```
        Gerencianet_Connection_TLS1.2_OK!
        ```
        
    * On failure:
        ```
        Emitted 'error' event at

* * *

## PHP

#### Requisitos
* Versão do PHP: >= 5.3 
* Versão da biblioteca cURL: >= 7.34.0
* Versão da biblioteca OpenSSL: >= 1.0.1c

#### Guia

Você pode encontrar informações sobre as bibliotecas OpenSSL dessa forma:

1. OpenSSL instalado em seu SO: 
    - Execute o comando `openssl version`.
1. OpenSSL que seu PHP está utilizando:
    - Procure essa informação dentro do arquivo `php.ini`.
1. Para encontrar a versão do OpenSSL de seu cURL, execute o comando abaixo em seu servidor
    ```
    php -r 'echo json_encode(curl_version(), JSON_PRETTY_PRINT);'
    ```

Todas essas bibliotecas OpenSSL podem ser diferentes, e atualizar uma não atualizará a outra automaticamente.

#### Executando exemplo de PHP

1. Baixe o arquivo `tls.php` do nosso [repositório](PHP/).
2. Coloque-o em seu servidor, e execute-o com o comando `php tls.php`

    * On success:    
        ```
        Gerencianet_Connection_TLS1.2_OK!
        ```
        
    * On failure:
        ```
        curl_error information

* * *

## Python

#### Requisitos

* Python usa o OpenSSL fornecido pelo sistema.
* TLSv1.2 precisa da versão OpenSSL 1.0.1c ou superior.

#### Verificando sua conexão com TLS 1.2.

1. Em um shell do seu **sistema de produção**, execute o seguinte comando: 

    * Para Python 2.x:

        ```
        $ python -c "import urllib2; print(urllib2.urlopen('https://tls.testegerencianet.com.br').read())"
        ```

    * Para Python 3.x:

        ```
        $ python -c "import urllib.request; print(urllib.request.urlopen('https://tls.testegerencianet.com.br').read())"
        ```
    
    * Ou execute o [arquivo](Python/tls.py) com o comando `python tls.py`

        * On success:
            
            ```
            Gerencianet_Connection_TLS1.2_OK!
            ```
        
        * On failure, an `URLError` is raised:
            
            ```
            urllib2.URLError: <urlopen error EOF occurred in violation of protocol (_ssl.c:590)>
            urllib2.URLError: <urlopen error [Errno 54] Connection reset by peer>
            ```

* * *

### .NET

#### Requisitos
Para habilitar o funcionamento do protocolo TLSv1.2 em seu sistema, a única coisa necessária é utilizar a versão mais recente do Mono(linux) ou .NET Framework (maior que 4.5, recomendado >= 4.6.2).

#### Verificando suas versões de .NET e TLS

1. Execute o arquivo `Tls.exe`, que pode ser encontrado clicando [repositório](C#/):

##### Windows:
  Execute o arquivo como qualquer outro `.exe` normalmente.

##### Linux:
  - Execute o comando a partir do `mono` da seguinte maneira:
    ```
    $ mono Tls.exe
    ```

  * On success:
            
            ```
            Gerencianet_Connection_TLS1.2_OK!
            ```
        
        * On failure, an `URLError` is raised:
            
            ```
            Failed!

* * *

## Ruby

#### Requisitos

* Ruby 2.0.0 ou superior é necessário para usar TLSv1.2.
* TLSv1.2 precisa da versão OpenSSL 1.0.1c ou superior.

#### Verificando sua conexão com TLS 1.2.

1. Em um shell do seu **sistema de produção**, execute o seguinte comando: 

    * 
    ```
    $ ruby -r'net/http' -e 'puts Net::HTTP.get(URI("https://tls.testegerencianet.com.br/"))'
    ```
    
    * Ou execute o [arquivo](Ruby/tls.rb) com o comando `ruby tls.rb`

        * On success:
            
            ```
            Gerencianet_Connection_TLS1.2_OK!
            ```
        
        * On failure, uma exceção `OpenSSL::SSL::SSLError` or `EOFError` é lançada.