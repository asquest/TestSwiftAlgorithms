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
        return copyStr
    }
}

extension String {
    var words: [String] {
        let tokenizer = NLTokenizer(unit: .word)
        let range = Range(uncheckedBounds: (lower: self.startIndex, upper: self.endIndex))
        tokenizer.string = self
        return tokenizer.tokens(for: range).map { "\(self[$0])" }
    }
}
