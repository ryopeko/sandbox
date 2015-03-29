package main

import (
	"fmt"
	"time"
	"sync"
)

func main() {
	wg := new(sync.WaitGroup)

	wg.Add(1)
	go func() {
		time.Sleep(3)
		fmt.Println("Hello")
		wg.Done()
	}()
	fmt.Println("Hi")
	wg.Wait()
}
