import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor
import TelegramVaporBot

// configures your application
public func configure(_ app: Application) async throws {

    let tgApi: String = "7185058155:AAGY5MHEN7I99vtlrVb2uEQFF8c5qKsifKI"
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGLongPollingConnection(bot: bot))
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()
}
