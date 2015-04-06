package main

import (
	"log"
	"os"
)

func main() {
	log_file, _ := os.OpenFile("/tmp/test.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)

	new_logger := log.New(log_file, "logger1:", log.Ldate|log.Ltime|log.Lshortfile)
	other_logger := log.New(log_file, "logger2:", log.Ldate|log.Ltime|log.Lshortfile)

	new_logger.Println("foo")
	other_logger.Println("bar")
}
