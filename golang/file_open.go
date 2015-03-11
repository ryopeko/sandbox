package main

import (
	"fmt"
	"io/ioutil"
)

func main() {
	lines, err := ioutil.ReadFile("hoge.csv")

	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println(string(lines))
}
