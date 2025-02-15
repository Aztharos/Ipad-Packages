import Swifter
import Ink
import Highlightr
import SwiftSoup

public struct MonPackageSwift {
    
    // Exemple d'une fonction qui utilise Swifter pour démarrer un serveur HTTP simple
    public static func startServer() {
        let server = HttpServer()
        
        server["/"] = { request in
            return .ok(.html("<h1>Bienvenue sur mon serveur Swift !</h1>"))
        }
        
        do {
            try server.start(8080)
            print("Serveur démarré sur le port 8080")
        } catch {
            print("Erreur en démarrant le serveur: \(error)")
        }
    }

    // Exemple d'une fonction pour parser du Markdown en HTML avec Ink
    public static func parseMarkdownToHTML(_ markdown: String) -> String {
        let parser = MarkdownParser()
        let html = parser.html(from: markdown)
        return html
    }

    // Exemple d'une fonction pour surligner du code avec Highlightr
    public static func highlightCode(_ code: String, language: String) -> String {
        let highlighter = Highlightr()
        let highlightedCode = highlighter.highlight(code, as: language)
        return highlightedCode ?? ""
    }

    // Exemple d'une fonction pour parser du HTML avec SwiftSoup
    public static func parseHTML(_ html: String) -> String {
        do {
            let doc = try SwiftSoup.parse(html)
            let title = try doc.title()
            return "Title of the document: \(title)"
        } catch {
            return "Erreur en parsant le HTML: \(error)"
        }
    }
}
