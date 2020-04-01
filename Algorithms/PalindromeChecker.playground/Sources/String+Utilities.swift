import Foundation
import NaturalLanguage

extension String {
    var words: [String] {
        let tokenizer = NLTokenizer(unit: .word)
        let range = Range(uncheckedBounds: (lower: self.startIndex, upper: self.endIndex))
        tokenizer.string = self
        return tokenizer.tokens(for: range).map { "\(self[$0])" }
    }
}
