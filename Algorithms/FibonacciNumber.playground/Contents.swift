import Foundation

func printFibonacciNumber(n: Int) -> Int {
    var a = 0
    var b = 1
    var count = 1

    guard n > 1 else {
        return n <= 1 ? a : b
    }
    while count != n {
        b = a+b
        a = b-a
        count += 1
    }
    return b
}

printFibonacciNumber(n: 5)


///* Using Matrix exponentiation to get the Fibonacci number */
//func multiply( _ matrixA:[[Int64]], _ matrixB:[[Int64]]) -> [[Int64]] {
//    if matrixA[ 0 ].count != matrixB.count {
//        print( "Illegal matrix dimensions!" )
//        return [[]] // returns empty matrix
//    }
//
//    let size = matrixA.count
//    var result:[[Int64]] = [[Int64]]( repeating: [Int64]( repeating: 0, count: size ), count: size )
//
//    for i in 0..< result.count {
//        for j in 0..< matrixA.count {
//            for k in 0..< matrixB.count {
//                result[i][j] += matrixA[i][k] * matrixB[k][j]
//            }
//        }
//    }
//    return result
//}
//
//func fib(_ n: Int64) -> Int64 {
//    var M: [[Int64]] = [[1, 1], [1, 0]]
//    guard n > 2 else { return n }
//    power(&M, n)
//    return M[0][0]
//
//}
//
//func power(_ matrix: inout [[Int64]], _ n: Int64) {
//    guard n > 1 else { return }
//    power(&matrix, n/2)
//    matrix = multiply(matrix, matrix)
//    if n % 2 != 0 {
//        let M: [[Int64]] = [[1, 1], [1, 0]]
//        matrix = multiply(matrix, M)
//    }
//}
//
//fib(90)
