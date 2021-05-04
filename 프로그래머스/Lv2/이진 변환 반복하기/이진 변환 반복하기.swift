import Foundation

func solution(_ s:String) -> [Int] {
    
    var s = s
    var convertCount = 0
    var removedZeroCount = 0
    while s != "1" {
        convertCount += 1
        var oneCount = 0
        var zeroCount = 0
        for char in s {
            if char == "1" {
                oneCount += 1
            } else {
                zeroCount += 1
            }
        }
        s = String(oneCount, radix: 2)
        removedZeroCount += zeroCount
    }
    
    return [convertCount, removedZeroCount]
}
