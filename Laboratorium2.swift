//cwiczenie 1
print("cwiczenie 1")
func minValue(_ a: Int, _ b: Int) -> Int {
    return a < b ? a : b
}

print(minValue(10, 5)) 
print(minValue(-3, 2)) 

func lastDigit(_ number: Int) -> Int {
    return abs(number) % 10
}

print(lastDigit(123))
print(lastDigit(-456))

func divides(_ a: Int, _ b: Int) -> Bool {
    return a % b == 0
}

func countDivisors(_ number: Int) -> Int {
    var count = 0
    for i in 1...number {
        if divides(number, i) {
            count += 1
        }
    }
    return count
}

func isPrime(_ number: Int) -> Bool {
    return countDivisors(number) == 2
}

print(divides(7, 3))
print(divides(8, 4))

print(countDivisors(1))
print(countDivisors(10))
print(countDivisors(12))

print(isPrime(3))
print(isPrime(8))
print(isPrime(13))

//cwiczenie 2
print("cwiczenie 2")

func smartBart(n: Int, closure: () -> Void) {
    for _ in 1...n {
        closure()
    }
}

smartBart(n: 3) {
    print("I will pass this course with the best mark, because Swift is great!")
}

let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
let multiplesOfFour = numbers.filter { $0 % 4 == 0 }
print(multiplesOfFour)

let largestNumber = numbers.reduce(numbers[0]) { max($0, $1) }
print(largestNumber)

var strings = ["Gdansk", "University", "of", "Technology"]
let combinedString = strings.reduce("") { $0 == "" ? $1 : $0 + " " + $1 }
print(combinedString)

let numbers2 = [1, 2 ,3 ,4, 5, 6]
let sumOfSquaresOfOdds = numbers2.filter { $0 % 2 != 0 }
                                .map { $0 * $0 }
                                .reduce(0, +)
print(sumOfSquaresOfOdds)

//cwiczenie 3
print("cwiczenie 3")

func minmax(_ a: Int, _ b: Int) -> (min: Int, max: Int) {
    return a < b ? (a, b) : (b, a)
}

let result = minmax(10, 5)
print("Min: \(result.min), Max: \(result.max)")

var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]

var countedStrings: [(String, Int)] = []

let uniqueStrings = Set(stringsArray)

for string in uniqueStrings {
    let count = stringsArray.filter { $0 == string }.count
    countedStrings.append((string, count))
}

print(countedStrings)

enum Day: Int {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday

    func dayEmoji() -> String {
        switch self {
        case .monday:
            return "🌞"
        case .tuesday:
            return "🌦"
        case .wednesday:
            return "🐪"
        case .thursday:
            return "🤓"
        case .friday:
            return "🎉"
        case .saturday:
            return "🛌"
        case .sunday:
            return "🌻"
        }
    }
}

let today = Day.monday
print("Today is \(today.rawValue) and emoji is \(today.dayEmoji())")






