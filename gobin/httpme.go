package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

type muxer struct {
	mux       *http.ServeMux
	serve_dir string
}

func main() {
	working_dir, _ := os.Getwd()

	port := flag.Int("p", 8000, "Port to run the server on")

	flag.Parse()

	args := flag.Args()

	var serve_dir string
	if len(args) >= 1 {
		if args[0][0] == []byte("/")[0] {
			serve_dir = args[0]
		} else {
			serve_dir = filepath.Join(working_dir, args[0])
		}
	} else {
		serve_dir = working_dir
	}

	server := &http.Server{
		Addr:    fmt.Sprintf(":%d", *port),
		Handler: newMux(serve_dir),
	}

	fmt.Printf("Serving %s on port %d\n", serve_dir, *port)
	log.Fatal(server.ListenAndServe())
}

func newMux(serve_dir string) *muxer {
	mux := &muxer{
		serve_dir: serve_dir,
		mux:       http.NewServeMux(),
	}

	fileServer := http.FileServer(http.Dir(serve_dir))
	mux.mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Cache-Control", "no-cache, no-store, must-revalidate")
		w.Header().Set("Pragma", "no-cache")
		w.Header().Set("Expires", "0")
		fmt.Printf("%s %s\n", r.Method, r.URL)

		fileServer.ServeHTTP(w, r)
	})

	return mux
}

func (mux *muxer) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	mux.mux.ServeHTTP(w, r)
}
