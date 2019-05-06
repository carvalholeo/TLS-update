# -*- coding: utf-8 -*-
import requests
import ssl

gn_request = requests.get("https://tls.testegerencianet.com.br")

if gn_request.status_code == 200:
	print(gn_request.text)
else:
	print("Sua versão SSL é: " + ssl.OPENSSL_VERSION)
	print("Sua versão deve ser superior à 1.0.1c")