//: [Previous](@previous)

import Foundation


//Check if Anagram is same
func isAnagram(firstStr: String, secondStr: String, enableLowerCase: Bool = false) -> Bool {
    let (first, second) = enableLowerCase ? (firstStr.lowercased(), secondStr.lowercased()) : (firstStr, secondStr)
    return Array(first).sorted() == Array(second).sorted()
}

isAnagram(firstStr: "cat", secondStr: "act")
isAnagram(firstStr: "dog", secondStr: "act")
isAnagram(firstStr: "Cat", secondStr: "act")
isAnagram(firstStr: "Cat", secondStr: "act", enableLowerCase: true)
