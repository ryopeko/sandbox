package main

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
)

func main() {
	response, _ := goquery.NewDocument("http://b.hatena.ne.jp/entrylist")

	urls := []string{}

	response.Find("a").Each(func(_ int, s *goquery.Selection) {
		url, _ := s.Attr("href")

		urls = append(urls, url)
	})
	fmt.Println(urls)
}
