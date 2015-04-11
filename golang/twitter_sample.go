package main
//https://github.com/kurrik/twittergo-examples/blob/master/stream/main.go

import (
	"fmt"
	"github.com/kurrik/oauth1a"
	"github.com/kurrik/twittergo"
	"io/ioutil"
	"strings"
)

func main() {
	config_file, err := ioutil.ReadFile("CREDENTIALS")

	if err != nil {
		return
	}
	lines := strings.Split(string(config_file), "\n")

	config := &oauth1a.ClientConfig{
		ConsumerKey: lines[0],
		ConsumerSecret: lines[1],
	}

	user := oauth1a.NewAuthorizedConfig(lines[2], lines[3])
	client := twittergo.NewClient(config, user)
	fmt.Println(client)
}
