package main

import (
	"fmt"
	"os"
	"bufio"
	"strings"
)

func main() {
	file, err := os.Open("hoge.csv")

	if err != nil {
		fmt.Println(err)
		return
	}

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		fmt.Println(strings.Split(scanner.Text(), ",")[0])
	}
}
