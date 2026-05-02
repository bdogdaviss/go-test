package websocket

import (
	"net/http"

	gws "github.com/gorilla/websocket"
)

var upgrader = gws.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func ServeWS(hub *Hub, w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		http.Error(w, "could not upgrade connection", http.StatusBadRequest)
		return
	}

	client := &Client{
		Hub:  hub,
		Conn: conn,
		Send: make(chan Message, 256),
	}

	hub.Register <- client

	go client.WritePump()
	go client.ReadPump()
}
