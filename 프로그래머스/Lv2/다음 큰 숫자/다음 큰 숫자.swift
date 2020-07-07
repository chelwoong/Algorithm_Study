import Foundation

func countOfOneInBinary(number n: Int) -> Int {
    var oneCount = 0
    var n = n
    while n/2 != 0 {
        if n%2 == 1 {
            oneCount += 1
        }
        n /= 2
    }

    return n == 0 ? oneCount : oneCount+1
}

func solution(_ n:Int) -> Int {
    var number = n+1
    var oneCount = countOfOneInBinary(number: n)
    while true {
        if countOfOneInBinary(number: number) == oneCount {
            break
        }
        number += 1
    }

    return number
}
