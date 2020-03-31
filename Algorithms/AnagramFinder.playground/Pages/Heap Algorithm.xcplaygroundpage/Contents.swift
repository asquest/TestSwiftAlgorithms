import Foundation

func permutations(_ n: Int, _ a: inout Array<Character>, _ result: inout [String]) {
    if n == 1 {
        result.append(String(a))
        return
    }
    for i in 0..<n-1 {
        print("\(i): \(n) -> \(a)")
        permutations(n-1, &a, &result)
        a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        print("swap(\(n-1), \((n%2 == 1) ? 0 : i))", a)
    }
    permutations(n-1, &a, &result)
}


var string = Array("act")
var result = [String]()
permutations(string.count, &string, &result)
let permStrings = result.map { $0 }
print(permStrings)
