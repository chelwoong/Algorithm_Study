

import Foundation

func friendList(from dist: [Int]) -> [[[Int]]] {
    var perm = [[[Int]]](repeating: [[Int]](), count: dist.count+1)
    var used = [Bool](repeating: false, count: dist.count)
    
    func permutation(_ idx: Int, list: inout [Int]) {
        perm[list.count].append(list)
        
        for i in idx..<dist.count where !used[i] {
            list.append(dist[i])
            used[i] = true
            permutation(idx+1, list: &list)
            _ = list.popLast()
            used[i] = false
        }
    }
    
    var list = [Int]()
    permutation(0, list: &list)
    
    return perm
}

func weakList(_ n: Int, _ weak: [Int]) -> [[Int]] {
    var weakList = [[Int]]()
    for start in 0..<weak.count {
        var list = [Int]()
        for i in start..<start+weak.count {
            let idx = i % weak.count
            let w = weak[idx] + (i/weak.count * n)
            list.append(w)
        }
        weakList.append(list)
    }

    return weakList
}

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {

    // dist permutation
    let checkList = friendList(from: dist)
    let wList = weakList(n, weak)
    // weak 포인트 체크
    var minSize = -1
    for memberSize in 1...dist.count {

        let list = checkList[memberSize]
        var success = false
        friendsLoop: for friends in list {
            for weaks in wList {
                var checkingPoint = 0
                for d in friends {
                    let endPoint = weaks[checkingPoint]+d
                    checkingPoint += 1
                    while checkingPoint < weaks.count, weaks[checkingPoint] <= endPoint {
                        checkingPoint += 1
                    }

                    if checkingPoint == weaks.count {
                        success = true
                        break friendsLoop
                    }
                }
            }
        }

        if success {
            minSize = memberSize
            break
        }
    }

    return minSize
}

 print(solution(12, [1, 5, 6, 10], [1, 2, 3, 4]))
print(solution(12, [1, 3, 4, 9, 10], [3, 5, 7]))

