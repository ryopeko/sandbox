package main

import (
	"fmt"
	"time"
)

func main() {
	go func() {
		time.Sleep(3)
		fmt.Println("Hello")
	}()
	fmt.Println("Hi")

}
