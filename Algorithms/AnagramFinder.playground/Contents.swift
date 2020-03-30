import Foundation
import NaturalLanguage

extension String {
    subscript(_ index: Int) -> String {
        get {
            String(Array(self)[index..<index + 1])
        }
        
        set(newValue) {
            var value = Array(self)
            value[index] = Character(newValue)
            self = String(value)
        }
    }
    
    func swap(sourceIndex: Int, destinationIndex: Int) -> String {
        let first = self[sourceIndex]
        let second = self[destinationIndex]
        
        var copyStr = self
        
        copyStr[sourceIndex] = second
        copyStr[destinationIndex] = first
        print("\(sourceIndex) --> \(destinationIndex)")
        print("BEFORE\(self): FIrst \(first), SECOND \(second): AFTER:\(copyStr)")
        return copyStr
    }
}

//Check if Anagram is same
func isAnagram(firstStr: String, secondStr: String, enableLowerCase: Bool = false) -> Bool {
    let (first, second) = enableLowerCase ? (firstStr.lowercased(), secondStr.lowercased()) : (firstStr, secondStr)
    return Array(first).sorted() == Array(second).sorted()
}

isAnagram(firstStr: "cat", secondStr: "act")
isAnagram(firstStr: "dog", secondStr: "act")
isAnagram(firstStr: "Cat", secondStr: "act")
isAnagram(firstStr: "Cat", secondStr: "act", enableLowerCase: true)


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


//func findAnagrams(word: String) -> [String] {
//    var newWord = word
//    var secondVPtr = 2 {
//        didSet {
//            
//            if secondVPtr == word.count {
//                secondVPtr = 0
//            }
//    
////            print("SecondPtr ---> ",secondVPtr)
//        }
//    }
//    
//    var firstVPtr = 1 {
//        didSet {
//            if firstVPtr == word.count {
//                firstVPtr = 0
//            }
//            secondVPtr = firstVPtr + 1
////             print("FirstPtr ---> ",firstVPtr)
//        }
//    }
//    
//    var firstPointer: Int = 0 {
//        didSet {
//            firstVPtr = firstPointer + 1
//        }
//    }
//    
//    
//    var wordDict: [String: [String]] = [:]
//    var wordArr = [String]()
//    while firstPointer < word.count {
//        var anagrams = [String]()
//        anagrams.append(contentsOf: <#T##Sequence#>)
//        while firstVPtr != firstPointer {
////            print("Out: First: \(firstPointer), Second: \(firstVPtr), Third: \(secondVPtr)")
//            
//            while secondVPtr != firstVPtr && secondVPtr != firstPointer {
//                guard firstPointer != secondVPtr else {
//                    secondVPtr += 1
//                    continue
//                    
//                }
//                let str = word.swap(sourceIndex: firstVPtr, destinationIndex: secondVPtr)
//                anagrams.append(str)
//                secondVPtr += 1
//            }
//            firstVPtr += 1
//        }
//        wordDict[word[firstPointer]] = anagrams
//        wordArr.append(contentsOf: anagrams)
//        firstPointer += 1
//    }
////    return wordDict.values.map { $0 }
//    return wordArr
//}
//findAnagrams(word: "act")
//
//
//
