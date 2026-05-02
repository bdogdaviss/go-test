package websocket

type Message struct {
	ChannelID string `json:"channelId"`
	UserID    string `json:"userId"`
	Body      string `json:"body"`
}
