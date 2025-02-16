# 🚀 **Complete Tutorial: Using Swift Packages on iPad**

This tutorial is designed to guide you through the use of popular Swift packages: **Swifter**, **Highlightr**, **Ink**, and **SwiftSoup**. We will cover basic aspects, advanced features, and best practices for leveraging each tool in your Swift projects. The tutorial is structured to progress from simple to complex.

---

## 🌐 **Swifter: Ultra-Light HTTP Server**

### 1. Introduction to Swifter
Swifter is a minimalist HTTP server written in Swift. It's designed to be fast, lightweight, and simple to use. This package is particularly useful for hosting local files, testing APIs during development, or even creating a simple server for a project.

### 2. Installing Swifter
1. Open your project in Swift Playgrounds or Xcode.
2. Add Swifter via **Swift Package Manager** (SPM) with the following URL:  
   `https://github.com/httpswift/swifter.git`
3. Import Swifter in your Swift file:  
   ```swift
   import Swifter

### 3. Starting a Simple HTTP Server

Here’s a basic example of starting an HTTP server, listening for requests, and responding with a simple HTML message:

```swift
import Swifter

// Create the server
let server = HttpServer()

// Define a simple GET route
server["/"] = { _ in
    return HttpResponse.ok(.html("<h1>Welcome to my Swifter server!</h1>"))
}

// Start the server on port 8080
do {
    try server.start(8080)
    print("Server is running at http://localhost:8080")
} catch {
    print("Error starting server: \(error)")
}
```

### 4. Adding Dynamic Routes

Swifter allows you to create dynamic routes with parameters. For example, a route that takes a parameter in the URL and returns it in the response:

```swift
server["/user/:username"] = { request in
    if let username = request.parameters["username"] {
        return HttpResponse.ok(.html("<h1>Welcome, \(username)!</h1>"))
    }
    return HttpResponse.notFound
}
```

### 5. Handling POST Requests

Swifter also allows handling POST requests. Here’s how to retrieve data sent via a POST request:

```swift
server["/submit"] = { request in
    guard let formData = try? request.readBody(as: String.self) else {
        return HttpResponse.badRequest
    }
    return HttpResponse.ok(.html("<h1>Form submitted with data: \(formData)</h1>"))
}
```

### 6. Conclusion on Swifter

Swifter is a powerful tool for quickly setting up HTTP servers. It can be used for local testing, APIs, or simple web applications. You can easily add routes, handle HTTP requests, and customize responses.

---

## 🎨 **Highlightr: Syntax Highlighting**

### 1. Introduction to Highlightr
Highlightr enables syntax highlighting for source code in multiple programming languages, based on the popular highlight.js library. This package is ideal for apps that need to display source code with syntax highlighting, such as code editors or documentation apps.

### 2. Installing Highlightr
1. Add Highlightr via SPM:  
   `https://github.com/raspu/Highlightr.git`
2. Import Highlightr in your file:  
   ```swift
   import Highlightr
   ```

### 3. Highlighting Source Code

Here’s how to highlight Swift code:

```swift
import Highlightr

let highlighter = Highlightr()

let swiftCode = """
import Foundation

let message = "Hello, World!"
print(message)
"""

if let highlightedCode = highlighter?.highlight(swiftCode, as: "swift") {
    print("Highlighted code:\n\(highlightedCode)")
}
```

### 4. Using Themes

Highlightr allows you to apply different syntax highlighting themes. You can apply an integrated theme like “github” or create your own.

```swift
highlighter?.setTheme(to: "github") // Apply the GitHub theme
```

### 5. Using Highlightr in a SwiftUI View

Integrating Highlightr in a SwiftUI view to display highlighted code:

```swift
import SwiftUI
import Highlightr

struct CodeView: View {
    let highlighter = Highlightr()
    let code = """
    let a = 10
    let b = 20
    let sum = a + b
    print(sum)
    """
    
    var body: some View {
        Text(highlighter?.highlight(code, as: "swift") ?? "")
            .font(.system(.body, design: .monospaced))
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
    }
}

struct ContentView: View {
    var body: some View {
        CodeView()
    }
}
```

### 6. Conclusion on Highlightr

Highlightr is incredibly useful for apps displaying source code. You can easily integrate syntax highlighting and handle multiple programming languages.

---

## ✍️ **Ink: Markdown Parser**

### 1. Introduction to Ink
Ink is a lightweight Markdown parser in Swift that converts Markdown text into HTML. It’s perfect for integrating formatted content into your apps, like articles or comments.

### 2. Installing Ink
1. Add Ink via SPM:  
   `https://github.com/JohnSundell/Ink.git`
2. Import Ink in your file:  
   ```swift
   import Ink
   ```

### 3. Converting Markdown to HTML

Here’s how to convert Markdown into HTML:

```swift
let markdownText = """
# Markdown Example

This is text with **bold elements** and *italic elements*.
"""

let html = Ink.Parser().parse(markdownText).html
print("Generated HTML:\n\(html)")
```

### 4. Adding Links and Images

Ink handles links and images as well. Here’s an example with links and images in Markdown:

```swift
let markdownWithLinks = """
[OpenAI](https://openai.com)
![Image](https://example.com/image.png)
"""

let htmlWithLinks = Ink.Parser().parse(markdownWithLinks).html
print("Generated HTML with links and images:\n\(htmlWithLinks)")
```

### 5. Conclusion on Ink

Ink is a great tool for parsing and displaying Markdown content in your apps. It reliably converts Markdown to HTML and allows you to easily display formatted content.

---

## 🕵️‍♂️ **SwiftSoup: HTML Manipulation**

### 1. Introduction to SwiftSoup
SwiftSoup is a Swift library for manipulating HTML, inspired by JSoup in Java. It allows you to parse, modify, and extract information from HTML documents, making it ideal for web scraping or manipulating HTML data.

### 2. Installing SwiftSoup
1. Add SwiftSoup via SPM:  
   `https://github.com/Aztharos/SwiftSoup.git`
2. Import SwiftSoup in your file:  
   ```swift
   import SwiftSoup
   ```

### 3. Parsing an HTML Document

Here’s how to parse an HTML document and extract information:

```swift
let htmlDocument = """
<html>
<head><title>SwiftSoup Example</title></head>
<body>
<h1>First document</h1>
<p>This is a text with a <strong>bold element</strong>.</p>
</body>
</html>
"""

if let document = try? SwiftSoup.parse(htmlDocument) {
    let title = try? document.title()
    let body = try? document.body()?.text()
    print("Title: \(title ?? "Unknown")")
    print("Body content: \(body ?? "No content")")
}
```

### 4. Modifying HTML Content

SwiftSoup also lets you modify the HTML content, such as changing a title or adding an element:

```swift
if let document = try? SwiftSoup.parse(htmlDocument) {
    try? document.title("New Title")
    try? document.body()?.append("<p>New element added!</p>")
    print("Modified HTML:\n\(document.html())")
}
```

### 5. Extracting Specific Elements

You can extract specific elements by their class or ID, which is useful for scraping data:

```swift
let htmlWithClasses = """
<html>
<body>
<div class="container">
  <p class="content">Text to extract.</p>
</div>
</body>
</html>
"""

if let document = try? SwiftSoup.parse(htmlWithClasses) {
    let content = try? document.select(".content").text()
    print("Extracted content: \(content ?? "No content")")
}
```

### 6. Conclusion on SwiftSoup

SwiftSoup is an extremely powerful tool for working with HTML documents. You can use it for parsing, modifying, and extracting data from HTML, making it an excellent choice for web scraping or data manipulation.

---

## 🏁 Final Conclusion

You now have a comprehensive understanding of these tools and how to use them in your iOS/macOS projects. Each of these packages has its own strengths and can be combined to create powerful applications:
- **Swifter**: Quickly set up local HTTP servers for testing or simple apps.
- **Highlightr**: Highlight source code in your app for a clean presentation.
- **Ink**: Convert Markdown text into HTML for formatted content.
- **SwiftSoup**: Parse and manipulate HTML data for web scraping or content management.

Feel free to combine these tools as needed and experiment with their advanced features to make your projects even more robust!
