import Fluent
import Vapor

func socketRoutes(_ app: Application) throws {
    app.webSocket("echo") { (req, ws) in
        ws.onText { ws, text in
            ws.send(text)
        }
    }
}
