package main

import (
	"fmt"
)

type Foo struct {
	name string
}

func main() {
	s := &Foo{name: "bar"}
	fmt.Println(s.name)
}
