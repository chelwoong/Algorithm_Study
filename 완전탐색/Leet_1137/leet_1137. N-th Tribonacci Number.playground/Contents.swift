
class Solution {
    
    // 시간초과
//    func tribonacci(_ n: Int) -> Int {
//        if n == 0 { return 0 }
//        if n == 1 { return 1 }
//        if n == 2 { return 1 }
//
//        return tribonacci(n-2) + tribonacci(n-1) + tribonacci(n-3)
//    }
    
    
}

var tribonacciDic = [Int: Int]()

//func tribonacci(_ n: Int) -> Int {
//    if n == 0 { tribonacciDic[0] = 0 }
//    if n == 1 { tribonacciDic[1] = 1 }
//    if n == 2 { tribonacciDic[2] = 1 }
//    if tribonacciDic[n] != nil { return tribonacciDic[n]! }
//
//    var n3 = 0
//    var n2 = 0
//    var n1 = 0
//
//    if let num = tribonacciDic[n-3] {
//        n3 = num
//    } else {
//        n3 = tribonacci(n-3)
//    }
//
//    if let num = tribonacciDic[n-2] {
//        n2 = num
//    } else {
//        n2 = tribonacci(n-2)
//    }
//
//    if let num = tribonacciDic[n-1] {
//        n1 = num
//    } else {
//        n1 = tribonacci(n-1)
//    }
//
//    tribonacciDic[n] = n3 + n2 + n1
//    return tribonacciDic[n]!
//}

func tribonacci(_ n: Int) -> Int {
    
    if n == 0 {
        return 0
    }
    
    if n <= 2 {
        return 1
    }
    
    var n1 = 0
    var n2 = 1
    var n3 = 1
    var result = 0
    
    for _ in 3...n {
        result = n3 + n2 + n1
        n1 = n2
        n2 = n3
        n3 = result
    }
    
    return result
}

tribonacci(25)
