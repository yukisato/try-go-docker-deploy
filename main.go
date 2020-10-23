package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, world!")
}

func main() {
	port := os.Args[1]
	fmt.Println("Server listening on port " + port + "...")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":"+port, nil)
}
