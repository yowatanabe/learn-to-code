package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Memo struct {
	ID      string `json:"id,omitempty"`
	Content string `json:"content,omitempty"`
}

var memos []Memo

func GetMemoEndpoint(w http.ResponseWriter, req *http.Request) {
	params := mux.Vars(req)
	for _, item := range memos {
		if item.ID == params["id"] {
			json.NewEncoder(w).Encode(item)
			return
		}
	}
	json.NewEncoder(w).Encode(&Memo{})
}

func CreateMemoEndpoint(w http.ResponseWriter, req *http.Request) {
	params := mux.Vars(req)
	var memo Memo
	_ = json.NewDecoder(req.Body).Decode(&memo)
	memo.ID = params["id"]
	memos = append(memos, memo)
	json.NewEncoder(w).Encode(memos)
}

func DeleteMemoEndpoint(w http.ResponseWriter, req *http.Request) {
	params := mux.Vars(req)
	for index, item := range memos {
		if item.ID == params["id"] {
			memos = append(memos[:index], memos[index+1:]...)
			break
		}
		json.NewEncoder(w).Encode(memos)
	}
}

func main() {
	router := mux.NewRouter()

	memos = append(memos, Memo{ID: "1", Content: "hogehoge"})
	memos = append(memos, Memo{ID: "2", Content: "fugafuga"})

	router.HandleFunc("/memo/{id}", GetMemoEndpoint).Methods("GET")
	router.HandleFunc("/memo/{id}", CreateMemoEndpoint).Methods("POST")
	router.HandleFunc("/memo/{id}", DeleteMemoEndpoint).Methods("DELETE")

	log.Fatal(http.ListenAndServe(":8080", router))
}
