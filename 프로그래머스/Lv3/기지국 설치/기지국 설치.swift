
import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    
    var curr = 0
    var needCount = 0
    let coverSize = w*2+1
    
    for station in stations {
        guard curr <= n else { break }
        guard station + w > curr else { continue }
        let left = station-w
        let right = station+w
        let needArea = left - curr-1
        
        if needArea >= 0 {
            needCount += needArea/coverSize
            needCount += needArea%coverSize == 0 ? 0 : 1
        }
        curr = right
    }
    
    if curr < n {
        let needArea = n+1 - curr-1
        if needArea >= 0 {
            needCount += needArea/coverSize
            needCount += needArea%coverSize == 0 ? 0 : 1
        }
    }
    
    return needCount
}

// print(solution(16, [9], 2))
print(solution(4, [2], 1))
