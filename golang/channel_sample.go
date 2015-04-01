package main

import (
	"fmt"
)

func f(num int) <-chan string {
	c := make(chan string)
	go func() {
		for i := 0; i < 100; i++ {
			c <- "goroutine " + fmt.Sprint(num) + " : " + fmt.Sprint(i)
		}
		close(c)
	}()
	return c
}

func main() {
	receive := f(1)

	for {
		msg, doing := <-receive

		fmt.Println(doing)
		switch {
		case doing:
			fmt.Println(msg)
		case !doing:
			return
		}
	}
}
