import UIKit

//func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
//    var orderedA = A.sorted(by: <)
//    var index = 0
//    for _ in 0..<K {
//        if orderedA[index] < 0 {
//            orderedA[index] *= -1
//            if orderedA[index+1] < 0 {
//                index += 1
//            }
//        } else if !orderedA.contains(0) {
//            orderedA.sort(by: <)
//            orderedA[0] *= -1
//        }
//    }
//
//    return orderedA.reduce(0, +)
//}

func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
    var orderedA = A.sorted(by: <)
    var index = 0
    var k = K
    while k > 0 {
        if orderedA[index] < 0 {
            orderedA[index] *= -1
            if orderedA[index+1] < 0 {
                index += 1
            }
            k -= 1
        } else if !orderedA.contains(0) {
            k %= 2
            if k == 1 {
                let sumA = orderedA.reduce(0, +)
                return sumA - 2 * orderedA.min()!
            }
            break
        } else {
            break
        }
    }

    return orderedA.reduce(0, +)
}

//[3,-1,0,2]
//3
largestSumAfterKNegations([8,-7,-3,-9,1,9,-6,-9,3], 8)
//largestSumAfterKNegations([-2,5,0,2,-2], 3)
//largestSumAfterKNegations([1,3,2,6,7,9], 3)
//largestSumAfterKNegations([4,2,3], 1)
largestSumAfterKNegations([3,-1,0,2], 3)
//largestSumAfterKNegations([2,-3,-1,5,-4], 2)
