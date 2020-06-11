import UIKit

func lastStoneWeight(_ stones: [Int]) -> Int {
    var orderedStones = stones.sorted()

    while orderedStones.count > 1 {
        let m1 = orderedStones.removeLast()
        let m2 = orderedStones.removeLast()
        let remain = m1 - m2
        
        if remain != 0 {
            orderedStones.append(remain)
            orderedStones.sort()
        }
    }
    return orderedStones.isEmpty ? 0 : orderedStones[0]
}

lastStoneWeight([2,7,4,1,8,1])
lastStoneWeight([2,2])
