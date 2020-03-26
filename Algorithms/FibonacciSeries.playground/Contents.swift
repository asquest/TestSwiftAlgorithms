import Foundation

func printFibonacciSeries(n: Int) -> Int {
    var a = 0
    var b = 1
    var count = 1
    
    guard n > 1 else {
        return n <= 0 ? a : b
    }
    while count != n {
        b = a+b
        a = b-a
        count += 1
    }
    return b
}

printFibonacciSeries(n: 4)



