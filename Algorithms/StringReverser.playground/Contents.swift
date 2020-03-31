import Cocoa

extension String {
    var isSpecial: Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        return false
    }
}

func reverseString(str: String) -> String {
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

let newStr = reverseString(str: "a,b$c")
