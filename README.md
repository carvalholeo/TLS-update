# TLSv1.2

O Conselho de Padrões de Segurança da Indústria de Cartões de Pagamento (PCI SSC) [determina](http://blog.pcisecuritystandards.org/migrating-from-ssl-and-early-tls) que **todos os processadores de cartão de crédito devem retirar versões desatualizadas do serviço de TLS conforme o prazo estabelecido pelo PCI.**.

Atendendo as especificações, a **Gerencianet** está fazendo a atualização dos protocolos.

## Introdução

Esse repositório contém dicas e instruções para te ajudar a verificar se seu sistema é compatível com certificados TLS 1.2.

Para cada linguagem de programação, existe um guia diferente, para que você descubra se seu sistema é compatível com o TLS 1.2 ou não. Escolha sua linguagem abaixo e veja os requisitos para que tudo funcione perfeitamente.

* [Node](#node)

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
      http_parser: '2.7.0',
      node: '8.6.0',
      v8: '6.0.287.53',
      uv: '1.14.1',
      zlib: '1.2.11',
      ares: '1.10.1-DEV',
      modules: '57',
      nghttp2: '1.25.0',
      openssl: '1.0.2l',
      icu: '59.1',
      unicode: '9.0',
      cldr: '31.0.1',
      tz: '2017b' 
    }
    ```

#### Executando exemplo de Node

1. Baixe o arquivo `tls.js` do nosso [repositório](Node/).
2. Coloque-o em seu servidor, e execute-o com o comando `node tls.js`