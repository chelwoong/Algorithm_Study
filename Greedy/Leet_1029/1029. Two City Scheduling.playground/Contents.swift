import UIKit

func twoCitySchedCost(_ costs: [[Int]]) -> Int {

    let orderCosts = costs.sorted { (n1, n2) -> Bool in
        let absN1 = abs(n1[0] - n1[1])
        let absN2 = abs(n2[0] - n2[1])
        return absN1 > absN2
    }

    var aCount = 0
    var bCount = 0
    var totalCost = 0

    for cost in orderCosts {
        if (bCount < costs.count/2 && cost[1] <= cost[0]) || aCount >= costs.count/2 {
            totalCost += cost[1]
            bCount += 1
        } else {
            totalCost += cost[0]
            aCount += 1
        }
    }
    return totalCost
}

// 다른 풀이
// A or B의 합 - (각각의 차이를 오름차순으로 정렬한 절반)
//
//func twoCitySchedCost(_ costs: [[Int]]) -> Int {
//
//    let costA = costs.map { $0[0] }
//    var sumA = costA.reduce(0, +)
//
//    let orderedDiff = costs.map { $0[1] - $0[0] }.sorted(by: <)
//    for i in 0..<orderedDiff.count/2 {
//        sumA += orderedDiff[i]
//    }
//
//    return sumA
//}
