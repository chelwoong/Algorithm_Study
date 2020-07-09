import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var orderedA = A.sorted(by: <)
    var orderedB = B.sorted(by: >)
    
    var result = 0
    for idx in 0..<A.count {
        result += orderedA[idx] * orderedB[idx]
    }
    
    return result
}
