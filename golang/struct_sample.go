package main

import (
	"fmt"
)

type Foo struct {
	name string
}

type Bar struct {
	Foo
	age int
}

func main() {
	foo := &Foo{name: "foo_name"}
	fmt.Println(foo.name)

	bar := &Bar{Foo: Foo{name: "bar_name"}, age: 22}
	fmt.Println(bar.name)
}
