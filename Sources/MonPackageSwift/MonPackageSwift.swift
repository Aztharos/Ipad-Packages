import Swifter
import Ink
import Highlightr
import SwiftSoup

public struct MonPackageSwift {
    
    // Fonction simple pour vérifier que Swifter est accessible
    public static func testSwifter() -> String {
        return "Swifter est bien importé !"
    }

    // Fonction simple pour vérifier qu'Ink est accessible
    public static func testInk() -> String {
        let parser = MarkdownParser()
        return parser.html(from: "**Test Markdown**")
    }

    // Fonction simple pour vérifier que Highlightr est accessible
    public static func testHighlightr() -> Bool {
        return Highlightr() != nil
    }

    // Fonction simple pour vérifier que SwiftSoup est accessible
    public static func testSwiftSoup() -> String {
        do {
            let doc = try SwiftSoup.parse("<html><head><title>Test</title></head><body></body></html>")
            return try doc.title()
        } catch {
            return "Erreur SwiftSoup"
        }
    }
}
