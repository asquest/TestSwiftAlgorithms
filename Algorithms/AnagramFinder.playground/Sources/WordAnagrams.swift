import Foundation

public func wordPermutations(str: String) -> [String] {
    var characters = Array(str)
    var result = [String]()
    func permutations(_ n: Int, _ a: inout Array<Character>, _ result: inout [String]) {
        if n == 1 {
            result.append(String(a))
            return
        }
        for i in 0..<n-1 {
            permutations(n-1, &a, &result)
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        permutations(n-1, &a, &result)
    }
    permutations(characters.count, &characters, &result)
    return result.map { $0 }
}
