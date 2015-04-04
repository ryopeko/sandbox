package main

import (
	"log"
	"os"
)

func main() {
	log_file, _ := os.OpenFile("/tmp/test.log", os.O_RDWR|os.O_CREATE, 0644)

	log.SetOutput(log_file)
	log.Println("bar")
}
