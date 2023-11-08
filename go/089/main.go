package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Product struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Price int    `json:"price"`
}

var products = []Product{
	{ID: 1, Name: "商品A", Price: 100},
	{ID: 2, Name: "商品B", Price: 200},
}

func getProducts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(products)
}

func main() {
	http.HandleFunc("/products", getProducts)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
