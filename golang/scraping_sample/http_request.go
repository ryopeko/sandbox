package main

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
)

func main() {
	response, _ := goquery.NewDocument("http://example.com/")
	response.Find("a").Each(func(_ int, s *goquery.Selection) {
		url, _ := s.Attr("href")
		fmt.Println(url)
	})
}
