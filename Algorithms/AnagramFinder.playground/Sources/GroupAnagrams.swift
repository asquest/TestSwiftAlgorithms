//: [Previous](@previous)

import Foundation

public func groupAnagrams(_ strs: String, enableLowerCase: Bool = false) -> [[String]] {
    let newString = enableLowerCase ? strs.lowercased() : strs
    let words = newString.words
    
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


