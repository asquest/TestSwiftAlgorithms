import Foundation

public func reverseString(str: String) -> String {
    var characters = Array(str)
    var left = 0
    var right = characters.count - 1
    while left<right {
        guard !"\(characters[left])".isSpecial else {
            left+=1
            continue
        }
        guard !"\(characters[right])".isSpecial else {
            right-=1
            continue
        }
        let rightChar = characters[right]
        characters[right] = characters[left]
        characters[left] = rightChar
        left+=1
        right-=1
    }
    return String(characters)
}
