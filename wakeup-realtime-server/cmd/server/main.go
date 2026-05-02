package main

import (
	"log"
	"net/http"

	"github.com/bdogdaviss/go-test/wakeup-realtime-server/api"
	"github.com/bdogdaviss/go-test/wakeup-realtime-server/internal/websocket"
)

func main() {
	hub := websocket.NewHub()
	go hub.Run()

	router := api.NewRouter(hub)

	log.Println("realtime server starting on :8080")
	if err := http.ListenAndServe(":8080", router); err != nil {
		log.Fatal(err)
	}
}
