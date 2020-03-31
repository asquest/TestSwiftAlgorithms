import Foundation


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
        return copyStr
    }
}


func findAnagrams(word: String) -> [String] {
    var newWord = word
    var secondVPtr = 2 {
        didSet {
            
            if secondVPtr == word.count {
                secondVPtr = 0
            }
    
//            print("SecondPtr ---> ",secondVPtr)
        }
    }
    
    var firstVPtr = 1 {
        didSet {
            if firstVPtr == word.count {
                firstVPtr = 0
            }
            secondVPtr = firstVPtr + 1
//             print("FirstPtr ---> ",firstVPtr)
        }
    }
    
    var firstPointer: Int = 0 {
        didSet {
            firstVPtr = firstPointer + 1
        }
    }
    
    
    var wordDict: [String: [String]] = [:]
    var wordArr = [String]()
    while firstPointer < word.count {
        var anagrams = [String]()
        let string = word.swap(sourceIndex: firstVPtr, destinationIndex: secondVPtr)
        anagrams.append(string)
        while firstVPtr != firstPointer {
//            print("Out: First: \(firstPointer), Second: \(firstVPtr), Third: \(secondVPtr)")
            
            while secondVPtr != firstVPtr && secondVPtr != firstPointer {
                guard firstPointer != secondVPtr else {
                    secondVPtr += 1
                    continue
                    
                }
                let str = word.swap(sourceIndex: firstVPtr, destinationIndex: secondVPtr)
                anagrams.append(str)
                secondVPtr += 1
            }
            firstVPtr += 1
        }
        wordDict[word[firstPointer]] = anagrams
        wordArr.append(contentsOf: anagrams)
        firstPointer += 1
    }
//    return wordDict.values.map { $0 }
    return wordArr
}
findAnagrams(word: "act")
