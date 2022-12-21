import Foundation
/**

 ***************************SWIFT STRING **************************

 */


// Initialize String
var emptyString = ""            // Empty (Mutable) String
let stillEmpty = String()       // Another empty String
let helloWorld = "Hello World!" // String literal

// properties
helloWorld.lowercased()
helloWorld.uppercased()
helloWorld.isEmpty


// Multi line string
let verse = """
    Hello World!
    This is multiline string!
    """

// Prefix & Suffix
let password = "12345"
password.hasPrefix("123")
password.hasSuffix("345")


// Drop & Remove
var name = "Tom Dick Harry"
name.dropFirst()
name.dropLast()
name.dropFirst(3)
name.dropLast(5)
name
name.removeFirst()
name.removeLast()
name

// String Concatenation
var first = "Hello"
var second = "World"
print(first + " " + second)

// String Interpolation
print("6 times 7 is \(6*7)")


// Working with Characters
for char in "Hello" {
    print(char)
}
let helloChars: [Character] = ["h", "e", "l", "l", "o"]
String(helloChars)

// Useful Characters Properties
let a = "A" as Character
let pi = "π" as Character
a.isASCII
pi.isASCII
a.asciiValue
pi.asciiValue

let five = "5" as Character
let half = "½" as Character
five.isNumber
half.isNumber

five.isWholeNumber
five.wholeNumberValue
half.isWholeNumber
half.wholeNumberValue

a.isLetter
let smiley = "😀" as Character
smiley.isSymbol
smiley.isLetter

let plus = "+" as Character
plus.isSymbol
plus.isLetter
plus.isMathSymbol
smiley.isMathSymbol

let dollar = "$" as Character
dollar.isCurrencySymbol

let qmark = "?" as Character
qmark.isPunctuation

let b = "b" as Character
let z = "Z" as Character
b.isLowercase
z.isUppercase
b.uppercased()
z.lowercased()


// Sring Indices

let hello = "hello"
let startIndex = hello.startIndex // 0
let endIndex = hello.endIndex //5
hello[startIndex]
hello[hello.index(after: startIndex)]
hello[hello.index(before: endIndex)]

hello[hello.index(startIndex, offsetBy: 1)]  // "e"
hello[hello.index(endIndex, offsetBy: -4)]   // "e"


for index in hello.indices {
  print(hello[index])
}

// Substring

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]

// Convert the result to a String for long-term storage.
let newString = String(beginning)

let endingIndex1 = greeting.index(greeting.startIndex, offsetBy: 7)
let ending1 = greeting[endingIndex1...]

let endingIndex2 = greeting.index(greeting.endIndex, offsetBy: -1)
let ending2 = greeting[endingIndex1..<endingIndex2]

///Insert A Character At Index
var stars = "******"
stars.insert("X", at: stars.index(stars.startIndex, offsetBy: 3)) // "***X***"

// Replace range of subsring
var stars2 = "***XYZ***"
if let xyzRange = stars2.firstRange(of: "XYZ") {
  stars2.replaceSubrange(xyzRange, with: "ABC") // "***ABC***"
}

let stars3 = stars2.replacingOccurrences(of: "ABC", with: "XYZ")


// Split & Join String

let exmaple = "1 2 3 4 5 6"
let stringToArray = exmaple.components(separatedBy: " ")
let stringFromArray = stringToArray.joined(separator: ",")

