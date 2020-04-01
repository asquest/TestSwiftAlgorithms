import Foundation

class Stack<T: Equatable> {
    private var arr:[T] = []
    
    var latest: T? {
        return arr.last
    }
    
    var isEmpty: Bool {
        guard arr.count > 0 else { return true }
        return false
    }

    func pop() {
        guard arr.count > 0 else { return }
        arr.removeLast()
    }

    func push(ele: T) {
        arr.append(ele)
    }
}
