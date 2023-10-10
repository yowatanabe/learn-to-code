package main

import (
	"fmt"
	"strings"
)

type Music struct {
	Title  string
	Artist string
}

type Video struct {
	Title    string
	Director string
}

var mediaLibrary []interface{}

func AddMusic(title, artist string) {
	music := Music{Title: title, Artist: artist}
	mediaLibrary = append(mediaLibrary, music)
}

func AddVideo(title, director string) {
	video := Video{Title: title, Director: director}
	mediaLibrary = append(mediaLibrary, video)
}

func DeleteMedia(title string) {
	for i, media := range mediaLibrary {
		switch m := media.(type) {
		case Music:
			if m.Title == title {
				mediaLibrary = append(mediaLibrary[:i], mediaLibrary[i+1:]...)
				return
			}
		case Video:
			if m.Title == title {
				mediaLibrary = append(mediaLibrary[:i], mediaLibrary[i+1:]...)
				return
			}
		}
	}
}

func ListMedia() {
	fmt.Println("Media Library:")
	for _, media := range mediaLibrary {
		switch m := media.(type) {
		case Music:
			fmt.Printf("Music: %s by %s\n", m.Title, m.Artist)
		case Video:
			fmt.Printf("Video: %s directed by %s\n", m.Title, m.Director)
		}
	}
}

func SearchMedia(keyword string) {
	fmt.Printf("Search Results for \"%s\":\n", keyword)
	for _, media := range mediaLibrary {
		switch m := media.(type) {
		case Music:
			if strings.Contains(strings.ToLower(m.Title), strings.ToLower(keyword)) || strings.Contains(strings.ToLower(m.Artist), strings.ToLower(keyword)) {
				fmt.Printf("Music: %s by %s\n", m.Title, m.Artist)
			}
		case Video:
			if strings.Contains(strings.ToLower(m.Title), strings.ToLower(keyword)) || strings.Contains(strings.ToLower(m.Director), strings.ToLower(keyword)) {
				fmt.Printf("Video: %s directed by %s\n", m.Title, m.Director)
			}
		}
	}
}

func main() {
	AddMusic("Song 1", "Artist 1")
	AddMusic("Song 2", "Artist 2")
	AddVideo("Movie 1", "Director 1")
	AddVideo("Movie 2", "Director 2")

	ListMedia()

	DeleteMedia("Song 1")
	DeleteMedia("Movie 1")

	ListMedia()

	SearchMedia("Song")
	SearchMedia("Movie")
}
