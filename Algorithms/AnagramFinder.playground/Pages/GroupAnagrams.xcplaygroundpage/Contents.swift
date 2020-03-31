//: [Previous](@previous)

import Foundation

func groupAnagrams(_ strs: String, enableLowerCase: Bool = false) -> [[String]] {
    let newString = enableLowerCase ? strs.lowercased() : strs
    let tokenizer = NLTokenizer(unit: .word)
    let range = Range(uncheckedBounds: (lower: newString.startIndex, upper: newString.endIndex))
    tokenizer.string = newString
    let words = tokenizer.tokens(for: range).map { "\(newString[$0])" }
    
    var dict: [[String.Element]: [String]] = [:]
    for word in words {
        var stringSet = Array(word)
        stringSet.sort()
        if dict[stringSet] != nil {
            dict[stringSet] = dict[stringSet]! + [word]
        } else {
            dict[stringSet] = [word]
        }
    }
    return dict.values.map { $0 }.filter { $0.count > 1}
}

groupAnagrams("The cat did listen to the silent sound and did act strange.")
