package main

import (
	"fmt"
	"net/http"
)

func main() {
	res, err := http.Get("http://example.com/")

	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(res)
}
