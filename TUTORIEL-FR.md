# 🚀 **Tutoriel Complet : Utilisation de Packages Swift sur iPad**

Ce tutoriel est conçu pour vous guider dans l'utilisation des packages Swift populaires : **Swifter**, **Highlightr**, **Ink** et **SwiftSoup**. Nous aborderons les aspects de base, les fonctionnalités avancées et les meilleures pratiques pour exploiter chaque outil dans vos projets Swift. Le tutoriel est structuré pour progresser du simple au complexe.

---

## 🌐 **Swifter : Serveur HTTP Ultra-Léger**

### 1. Introduction à Swifter
Swifter est un serveur HTTP minimaliste écrit en Swift. Il est conçu pour être rapide, léger et simple à utiliser. Ce package est particulièrement utile pour héberger des fichiers locaux, tester des API pendant le développement ou même créer un serveur simple pour un projet.

### 2. Installation de Swifter
1. Ouvrez votre projet dans Swift Playgrounds ou Xcode.
2. Ajoutez Swifter via **Swift Package Manager (SPM)** avec l'URL suivante :  
   `https://github.com/httpswift/swifter.git`
3. Importez Swifter dans votre fichier Swift :  
   ```swift
   import Swifter
   ```

### 3. Démarrer un serveur HTTP simple

Voici un exemple de base pour démarrer un serveur HTTP, écouter les requêtes et répondre avec un message HTML simple :

```swift
import Swifter

// Créer le serveur
let server = HttpServer()

// Définir une route GET simple
server["/"] = { _ in
    return HttpResponse.ok(.html("<h1>Bienvenue sur mon serveur Swifter !</h1>"))
}

// Démarrer le serveur sur le port 8080
do {
    try server.start(8080)
    print("Le serveur fonctionne à l'adresse http://localhost:8080")
} catch {
    print("Erreur lors du démarrage du serveur : \(error)")
}
```

### 4. Ajouter des routes dynamiques

Swifter permet de créer des routes dynamiques avec des paramètres. Par exemple, une route qui prend un paramètre dans l'URL et le renvoie dans la réponse :

```swift
server["/user/:username"] = { request in
    if let username = request.parameters["username"] {
        return HttpResponse.ok(.html("<h1>Bienvenue, \(username) !</h1>"))
    }
    return HttpResponse.notFound
}
```

### 5. Gérer les requêtes POST

Swifter permet également de gérer les requêtes POST. Voici comment récupérer les données envoyées via une requête POST :

```swift
server["/submit"] = { request in
    guard let formData = try? request.readBody(as: String.self) else {
        return HttpResponse.badRequest
    }
    return HttpResponse.ok(.html("<h1>Formulaire soumis avec les données : \(formData)</h1>"))
}
```

### 6. Conclusion sur Swifter

Swifter est un outil puissant pour configurer rapidement des serveurs HTTP. Il peut être utilisé pour des tests locaux, des API ou des applications web simples. Vous pouvez facilement ajouter des routes, gérer des requêtes HTTP et personnaliser les réponses.

---

## 🎨 **Highlightr : Mise en évidence de la syntaxe**

### 1. Introduction à Highlightr
Highlightr permet la mise en évidence de la syntaxe pour le code source dans plusieurs langages de programmation, basé sur la bibliothèque highlight.js. Ce package est idéal pour les applications qui doivent afficher du code source avec une mise en évidence de la syntaxe, comme les éditeurs de code ou les applications de documentation.

### 2. Installation de Highlightr
1. Ajoutez Highlightr via SPM :  
   `https://github.com/raspu/Highlightr.git`
2. Importez Highlightr dans votre fichier :  
   ```swift
   import Highlightr
   ```

### 3. Mettre en évidence du code source

Voici comment mettre en évidence du code Swift :

```swift
import Highlightr

let highlighter = Highlightr()

let swiftCode = """
import Foundation

let message = "Hello, World!"
print(message)
"""

if let highlightedCode = highlighter?.highlight(swiftCode, as: "swift") {
    print("Code mis en évidence :\n\(highlightedCode)")
}
```

### 4. Utiliser des thèmes

Highlightr permet d'appliquer différents thèmes de mise en évidence de la syntaxe. Vous pouvez appliquer un thème intégré comme "github" ou créer le vôtre.

```swift
highlighter?.setTheme(to: "github") // Appliquer le thème GitHub
```

### 5. Utiliser Highlightr dans une vue SwiftUI

Intégrer Highlightr dans une vue SwiftUI pour afficher du code mis en évidence :

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

### 6. Conclusion sur Highlightr

Highlightr est incroyablement utile pour les applications qui affichent du code source. Vous pouvez facilement intégrer la mise en évidence de la syntaxe et gérer plusieurs langages de programmation.

---

## ✍️ **Ink : Analyseur Markdown**

### 1. Introduction à Ink
Ink est un analyseur Markdown léger en Swift qui convertit du texte Markdown en HTML. Il est parfait pour intégrer du contenu formaté dans vos applications, comme des articles ou des commentaires.

### 2. Installation de Ink
1. Ajoutez Ink via SPM :  
   `https://github.com/JohnSundell/Ink.git`
2. Importez Ink dans votre fichier :  
   ```swift
   import Ink
   ```

### 3. Convertir Markdown en HTML

Voici comment convertir du Markdown en HTML :

```swift
let markdownText = """
# Exemple Markdown

Ceci est un texte avec **des éléments en gras** et *des éléments en italique*.
"""

let html = Ink.Parser().parse(markdownText).html
print("HTML généré :\n\(html)")
```

### 4. Ajouter des liens et des images

Ink gère également les liens et les images. Voici un exemple avec des liens et des images en Markdown :

```swift
let markdownWithLinks = """
[OpenAI](https://openai.com)
![Image](https://example.com/image.png)
"""

let htmlWithLinks = Ink.Parser().parse(markdownWithLinks).html
print("HTML généré avec liens et images :\n\(htmlWithLinks)")
```

### 5. Conclusion sur Ink

Ink est un excellent outil pour analyser et afficher du contenu Markdown dans vos applications. Il convertit de manière fiable le Markdown en HTML et vous permet d'afficher facilement du contenu formaté.

---

## 🕵️‍♂️ **SwiftSoup : Manipulation HTML**

### 1. Introduction à SwiftSoup
SwiftSoup est une bibliothèque Swift pour manipuler du HTML, inspirée de JSoup en Java. Elle vous permet de parser, modifier et extraire des informations à partir de documents HTML, ce qui en fait un outil idéal pour le web scraping ou la manipulation de données HTML.

### 2. Installation de SwiftSoup
1. Ajoutez SwiftSoup via SPM :  
   `https://github.com/Aztharos/SwiftSoup.git`
2. Importez SwiftSoup dans votre fichier :  
   ```swift
   import SwiftSoup
   ```

### 3. Analyser un document HTML

Voici comment analyser un document HTML et extraire des informations :

```swift
let htmlDocument = """
<html>
<head><title>Exemple SwiftSoup</title></head>
<body>
<h1>Premier document</h1>
<p>Ceci est un texte avec un <strong>élément en gras</strong>.</p>
</body>
</html>
"""

if let document = try? SwiftSoup.parse(htmlDocument) {
    let title = try? document.title()
    let body = try? document.body()?.text()
    print("Titre : \(title ?? "Inconnu")")
    print("Contenu du corps : \(body ?? "Aucun contenu")")
}
```

### 4. Modifier le contenu HTML

SwiftSoup vous permet également de modifier le contenu HTML, comme changer un titre ou ajouter un élément :

```swift
if let document = try? SwiftSoup.parse(htmlDocument) {
    try? document.title("Nouveau titre")
    try? document.body()?.append("<p>Nouvel élément ajouté !</p>")
    print("HTML modifié :\n\(document.html())")
}
```

### 5. Extraire des éléments spécifiques

Vous pouvez extraire des éléments spécifiques par leur classe ou leur ID, ce qui est utile pour le web scraping :

```swift
let htmlWithClasses = """
<html>
<body>
<div class="container">
  <p class="content">Texte à extraire.</p>
</div>
</body>
</html>
"""

if let document = try? SwiftSoup.parse(htmlWithClasses) {
    let content = try? document.select(".content").text()
    print("Contenu extrait : \(content ?? "Aucun contenu")")
}
```

### 6. Conclusion sur SwiftSoup

SwiftSoup est un outil extrêmement puissant pour travailler avec des documents HTML. Vous pouvez l'utiliser pour parser, modifier et extraire des données HTML, ce qui en fait un excellent choix pour le web scraping ou la manipulation de données.

---

## 🏁 **Conclusion Finale**

Vous avez maintenant une compréhension complète de ces outils et de la manière de les utiliser dans vos projets iOS/macOS. Chacun de ces packages a ses propres forces et peut être combiné pour créer des applications puissantes :
- **Swifter** : Configurer rapidement des serveurs HTTP locaux pour des tests ou des applications simples.
- **Highlightr** : Mettre en évidence du code source dans votre application pour une présentation claire.
- **Ink** : Convertir du texte Markdown en HTML pour du contenu formaté.
- **SwiftSoup** : Parser et manipuler des données HTML pour le web scraping ou la gestion de contenu.

N'hésitez pas à combiner ces outils selon vos besoins et à expérimenter leurs fonctionnalités avancées pour rendre vos projets encore plus robustes !
