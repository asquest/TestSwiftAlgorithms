import Foundation
import NaturalLanguage

class Stack<T: Equatable> {
    private var arr:[T] = []
    
    var latest: T? {
        return arr.last
    }
    
    var isEmpty: Bool {
        guard arr.count > 0 else { return true }
        return false
    }

    func pop() {
        guard arr.count > 0 else { return }
        arr.removeLast()
    }

    func push(ele: T) {
        arr.append(ele)
    }
}

func checkPalindrome<T>(characters: T) -> Bool where T: Sequence, T.Element: Equatable {
    let stack = Stack<T.Element>()
    let pivot: Int? = characters.count % 2 == 1 ? (characters.count + 1)/2 : nil
    var count = 1
    for character in characters {
        guard count != pivot else {
            count += 1
            continue
        }
        print("In Count here \(count)")
        if stack.latest == character {
            stack.pop()
        } else {
            stack.push(ele: character)
        }
        count += 1
    }
    return stack.isEmpty
}

func checkPhrase(unit: NLTokenUnit = .word, str: String, enableLowerCase: Bool  = false) -> [String: Bool] {
    let newString = enableLowerCase ? str.lowercased() : str
    let tokenizer = NLTokenizer(unit: unit)
    let range = Range(uncheckedBounds: (lower: newString.startIndex, upper: newString.endIndex))
    tokenizer.string = newString
    let words = tokenizer.tokens(for: range).map { "\(newString[$0])" }
    
    var phrasePalindromeChecker: [String: Bool] = [:]
    for word in words {
        phrasePalindromeChecker[word] = checkPalindrome(characters: word)
    }
    return phrasePalindromeChecker
}

extension Int: Sequence, IteratorProtocol {
    public typealias Element = Int
    
    mutating public func next() -> Int? {
        guard self != 0 else { return nil }
        let remainder = self % 10
        self = self / 10 != 0 ? self / 10 : 0
        return remainder
    }
}

extension Sequence {
    var count: Int { return reduce(0) { acc, row in acc + 1 } }
}

checkPalindrome(characters: 12345)
checkPalindrome(characters: 12321)
checkPalindrome(characters: "12345")
checkPalindrome(characters: "12321")
checkPalindrome(characters: [1, 2, 3, 4, 5])
checkPalindrome(characters: [1, 2, 3, 2, 1])
checkPhrase(str: "madaM Anna anNa Civic racecar", enableLowerCase: true)
checkPhrase(str: "madaM Anna anNa Civic racecar")















//func checkPalindrome<T>(characters: T) -> Bool where T: Sequence, T.Element: Equatable {
//    print(characters)
//    func recursiveTest(characters: T) -> Bool {
//        if characters.count < 2 {
//            return true
//        } else {
//            characters.dr
//            let first = characters.dropFirst().first(where: { _ in return true })
//            let last = characters.dropLast().first(where: { _ in return true })
//            print(characters)
//            print(characters.dropFirst())
//             print(characters.dropLast())
//            print("\(first) == \(last)")
//            if first != last {
//                return false
//            } else {
//                return recursiveTest(characters: characters)
//            }
//        }
//    }
//    return recursiveTest(characters: characters)
//}
