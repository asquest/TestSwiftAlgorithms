import Foundation

//var str = "Hello, playground"
//
//class Stack<T: Equatable> {
//    private var arr:[T] = []
//
//    func pop() {
//        guard arr.count > 0 else { return }
//        arr.removeLast()
//    }
//
//    func push(ele: T) {
//        arr.append(ele)
//    }
//
//}
//
//func checkPalindrome<T>(characters: T) -> Bool where T: Sequence, T.Element: Equatable {
//    var isNotSameCount = 0
//    for character in characters {
//        if isNotSameCount > 1 {
//            return false
//        } else {
//            if
//        }
//    }
//
//}



//func checkPalindrome<T>(characters: T) -> Bool where T: Sequence, T.Element: Equatable {
//    print(characters)
//    func recursiveTest(characters: T) -> Bool {
//        if characters.count < 2 {
//            return true
//        } else {
//            characters.dr
//            let first = characters.dropFirst().first(where: { _ in return true })
//            let last = characters.dropLast().first(where: { _ in return true })
//            print(characters)
//            print(characters.dropFirst())
//             print(characters.dropLast())
//            print("\(first) == \(last)")
//            if first != last {
//                return false
//            } else {
//                return recursiveTest(characters: characters)
//            }
//        }
//    }
//    return recursiveTest(characters: characters)
//}


extension Int: Sequence, IteratorProtocol {
    public typealias Element = Int
    
    mutating public func next() -> Int? {
        guard self != 0 else { return nil }
        let remainder = self % 10
        self = self / 10 != 0 ? self / 10 : 0
        return remainder
    }
}

extension Sequence {
    var count: Int { return reduce(0) { acc, row in acc + 1 } }
}

//checkPalindrome(characters: 12345)
//checkPalindrome(characters: 12321)
//checkPalindrome(characters: "12345")
//checkPalindrome(characters: "12321")
//checkPalindrome(characters: [1, 2, 3, 4, 5])
//checkPalindrome(characters: [1, 2, 3, 2, 1])
