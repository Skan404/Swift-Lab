print("Strings and Text")

var number1 = 5
var number2 = 10
let sum = number1 + number2
print("\(number1) + \(number2) = \(sum)")

var originalString = "Gdansk University of Technology"
var newString = ""

for character in originalString {
    if character == "n" {
        newString += "⭐️"
    } else {
        newString += String(character)
    }
}

print(newString)


var myName = "Szymon Kaniewski"
let reversedMyName = String(myName.reversed())
print("\(myName) -> \(reversedMyName)")

print("\nControl Flow")
for _ in 1...11 {
    print("I will pass this course with best mark, because Swift is great!")
}

let N = 5
for i in 1...N {
    print("\(i*i)", terminator: " ; ")
}
print("\n")

for _ in 1...N {
    for _ in 1...N {
        print("@", terminator: "")
    }
    print("")
}

print("\nArrays ")

var numbers = [5, 10, 20, 15, 80, 13]
if let maxValue = numbers.max() {
    print("Maximum z tablicy to: \(maxValue)")
}

let reversedNumbers = numbers.reversed()
print("Reversed order:", reversedNumbers.map(String.init).joined(separator: "  "))

var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var uniqueNumbers: [Int] = []

for number in allNumbers {
    if !uniqueNumbers.contains(number) { 
        uniqueNumbers.append(number) 
    }
}
print("unique =", uniqueNumbers)


print("\nSets  ")

var number = 10
var divisors: Set<Int> = []

for i in 1...number {
    if number % i == 0 {
        divisors.insert(i)
    }
}

let sortedDivisors = divisors.sorted()
print("divisors = \(sortedDivisors)")


print("\nDictionaries   ")
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]

let flightNumbers = flights.compactMap { $0["flightNumber"] }

print("flightNumbers = \(flightNumbers)")

var names = ["Hommer", "Lisa", "Bart"]

let fullName = names.map { name in
    ["firstName": name, "lastName": "Simpson"]
}

print("fullName = \(fullName)")

