package websocket

import (
	"log"

	gws "github.com/gorilla/websocket"
)

type Client struct {
	Hub  *Hub
	Conn *gws.Conn
	Send chan Message
}

func (c *Client) ReadPump() {
	defer func() {
		c.Hub.Unregister <- c
		_ = c.Conn.Close()
	}()

	for {
		var msg Message
		if err := c.Conn.ReadJSON(&msg); err != nil {
			log.Println("read error:", err)
			break
		}
		c.Hub.Broadcast <- msg
	}
}

func (c *Client) WritePump() {
	defer func() {
		_ = c.Conn.Close()
	}()

	for msg := range c.Send {
		if err := c.Conn.WriteJSON(msg); err != nil {
			log.Println("write error:", err)
			break
		}
	}
}
