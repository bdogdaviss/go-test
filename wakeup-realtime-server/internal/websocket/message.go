package websocket

type Message struct {
	Type    string `json:"type"`
	Channel string `json:"channel"`
	UserID  string `json:"userId"`
	Body    string `json:"body"`
}
