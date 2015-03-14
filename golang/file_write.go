package main

import (
	"os"
)

func main() {
	f, _ := os.Create("foo.txt")
	body := "bar"

	f.WriteString(body)
}
