import Foundation

class WordGuessingGame {
    var wordToGuess: String
    var guessedLetters: [Character]
    var numberOfTries: Int
    var categories: [String: [String]]
    var level: String

    init(categories: [String: [String]]) {
        self.wordToGuess = ""
        self.guessedLetters = []
        self.numberOfTries = 0
        self.categories = categories
        self.level = ""
    }

    func chooseCategory() {
        print("Wybierz kategorię: ")
        for category in categories.keys {
            print(category)
        }
        let chosenCategory = readLine() ?? ""
        if let words = categories[chosenCategory] {
            wordToGuess = words.randomElement() ?? ""
            guessedLetters = Array(repeating: "_", count: wordToGuess.count)
        }
    }

    func chooseLevel() {
        print("Wybierz poziom trudności (łatwy, średni, trudny): ")
        level = readLine() ?? ""
        switch level {
        case "łatwy":
            numberOfTries = wordToGuess.count * 2
        case "średni":
            numberOfTries = wordToGuess.count
        case "trudny":
            numberOfTries = wordToGuess.count / 2
        default:
            numberOfTries = wordToGuess.count
        }
    }

    func drawBoard() {
        print(guessedLetters)
        print("Pozostałe próby: \(numberOfTries)")
    }

    func guessLetter(_ letter: Character) {
        if letter == "." {
            guessWord()
        } else if wordToGuess.contains(letter) {
            for (index, wordLetter) in wordToGuess.enumerated() {
                if wordLetter == letter {
                    guessedLetters[index] = letter
                }
            }
        } else {
            numberOfTries -= 1
        }
    }

    func guessWord() {
        print("Podaj całe hasło: ")
        let word = readLine() ?? ""
        if word == wordToGuess {
            guessedLetters = Array(wordToGuess)
        } else {
            numberOfTries -= 1
        }
    }

    func gameLoop() {
        chooseCategory()
        chooseLevel()
        while numberOfTries > 0 && guessedLetters.contains("_") {
            drawBoard()
            print("Podaj literę lub wpisz '.' aby zgadnąć całe hasło: ")
            let letter = Character(readLine() ?? "")
            guessLetter(letter)
        }

        drawBoard()
        if guessedLetters.contains("_") {
            print("Przegrałeś! Słowo to: \(wordToGuess)")
        } else {
            print("Wygrałeś!")
        }
    }
}

let categories = ["miasta": ["gdansk", "warszawa", "krakow"], "filmy": ["titanic", "awatar", "incepcja"], "książki": ["hobbit", "potop", "ogniem i mieczem"]]
let game = WordGuessingGame(categories: categories)
game.gameLoop()
