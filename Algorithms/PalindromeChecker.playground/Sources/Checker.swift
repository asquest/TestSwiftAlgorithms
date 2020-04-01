import Foundation

public func checkPalindrome<T>(characters: T) -> Bool where T: Sequence, T.Element: Equatable {
    let stack = Stack<T.Element>()
    let pivot: Int? = characters.count % 2 == 1 ? (characters.count + 1)/2 : nil
    var count = 1
    for character in characters {
        guard count != pivot else {
            count += 1
            continue
        }
        if stack.latest == character {
            stack.pop()
        } else {
            stack.push(ele: character)
        }
        count += 1
    }
    return stack.isEmpty
}

public func checkPhrase(str: String, enableLowerCase: Bool  = false) -> [String: Bool] {
    let newString = enableLowerCase ? str.lowercased() : str
    let words = newString.words
    
    var phrasePalindromeChecker: [String: Bool] = [:]
    for word in words {
        phrasePalindromeChecker[word] = checkPalindrome(characters: word)
    }
    return phrasePalindromeChecker
}
