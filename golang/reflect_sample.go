package main

import (
	"fmt"
	"reflect"
)

func main() {
	slice := []string{}
	fmt.Println(reflect.TypeOf(123))
	fmt.Println(reflect.TypeOf(123.45))
	fmt.Println(reflect.TypeOf("foo"))
	fmt.Println(reflect.TypeOf(slice))
}
