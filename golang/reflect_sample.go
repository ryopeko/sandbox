package main

import (
	"fmt"
	"reflect"
)

func main() {
	slice := []string{}
	fmt.Println(reflect.TypeOf("foo"))
	fmt.Println(reflect.TypeOf(slice))
}
