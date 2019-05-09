package main

import (
	"net/http"
	"log"
	"io/ioutil"
)

func main() {
	MakeRequest()
}

func MakeRequest() {
	resp, err := http.Get("https://tls.testegerencianet.com.br")
	if err != nil {
		log.Fatalln(err)
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	log.Println(string(body))
}
