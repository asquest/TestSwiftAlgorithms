import Foundation

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
