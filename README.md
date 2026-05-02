# go-test

Starter repository based on the Wake Up project structure.

This repo includes:
- An iPhone app folder layout for a SwiftUI application
- A Go backend layout for WebSockets, channels, and goroutines

## Structure

### iPhone app
- WakeupMobile/
  - App/
  - Features/
    - Auth/
    - Home/
    - Chat/
    - Notifications/
    - Settings/
  - Core/
    - DesignSystem/
    - Utilities/
    - Extensions/
    - Models/
    - Services/
    - Networking/
      - WebSocketService/
      - APIClient/
    - Storage/
  - ViewModels/
  - Resources/
    - Assets/
    - PreviewContent/
  - Tests/
    - WakeupMobileTests/
    - WakeupMobileUITests/

### Go backend
- wakeup-realtime-server/
  - cmd/server/main.go
  - config/
  - internal/websocket/
    - handler.go
    - client.go
    - hub.go
    - message.go
  - internal/channels/
    - broadcast.go
    - presence.go
  - internal/workers/
    - jobs.go
    - dispatcher.go
  - api/
    - routes.go
    - middleware.go
  - pkg/logger/logger.go
  - pkg/utils/utils.go
  - test/
    - websocket_test.go
    - integration_test.go
  - go.mod
  - go.sum
  - .env.example
  - .gitignore

## Notes
Use SwiftUI for the mobile app and Go for the realtime backend.