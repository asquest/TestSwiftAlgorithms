import Foundation


//Check if Anagram is same
public func isAnagram(firstStr: String, secondStr: String, enableLowerCase: Bool = false) -> Bool {
    let (first, second) = enableLowerCase ? (firstStr.lowercased(), secondStr.lowercased()) : (firstStr, secondStr)
    return Array(first).sorted() == Array(second).sorted()
}

 
