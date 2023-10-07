package main

import "fmt"

type Article struct {
	Title    string
	Content  string
	Comments []string
}

var topics = make(map[string][]Article)

func AddArticle(topic, title, content string) {
	article := Article{
		Title:    title,
		Content:  content,
		Comments: []string{},
	}
	topics[topic] = append(topics[topic], article)
}

func GetArticlesByTopic(topic string) []Article {
	return topics[topic]
}

func AddComment(topic, title, comment string) {
	articles := topics[topic]
	for i := range articles {
		if articles[i].Title == title {
			articles[i].Comments = append(articles[i].Comments, comment)
			break
		}
	}
}

func main() {
	AddArticle("Technology", "Go Programming", "An introduction to Go programming.")

	AddComment("Technology", "Go Programming", "Great article!")
	AddComment("Technology", "Go Programming", "Nice!")

	fmt.Println("Technology Articles:")
	techArticles := GetArticlesByTopic("Technology")
	for _, article := range techArticles {
		fmt.Printf("Title: %s\n", article.Title)
		fmt.Printf("Content: %s\n", article.Content)
		fmt.Printf("Comments: %s\n", article.Comments)
		fmt.Println()
	}
}
