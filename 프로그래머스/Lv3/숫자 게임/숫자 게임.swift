import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    let orderedA = a.sorted()
    let orderedB = b.sorted()
    
    var aIdx = 0
    var winner = 0
    for bIdx in 0..<b.count {
        if orderedB[bIdx] > orderedA[aIdx] {
            winner += 1
            aIdx += 1
        }
    }
    
    return winner
}

print(solution([5,1,3,7], [2,2,6,8]))
