
import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
typealias Point = (r: Int, c: Int)
var virusArea = [Point]()
for r in 0..<nm[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    
    for c in 0..<nm[0] {
        if map[r][c] == 2 {
            virusArea.append((r, c))
        }
    }
}

func nexts(_ p: Point) -> [Point] {
    return [
        (p.r-1, p.c),
        (p.r+1, p.c),
        (p.r, p.c-1),
        (p.r, p.c+1),
    ]
}

func isInRange(_ p: Point) -> Bool {
    return 0..<nm[0] ~= p.r && 0..<nm[0] ~= p.c
}

var selected = [Point]()
var minimumTime = -1

func selectVirus(curr: Int) {
    if selected.count == nm[1] {
        let time = infectTime(selected)
        if time != -1 {
            if minimumTime == -1 {
                minimumTime = time
            } else if minimumTime > time {
                minimumTime = time
            }
        }
        return
    }
    
    guard curr < virusArea.count else { return }
    selected.append(virusArea[curr])
    selectVirus(curr: curr+1)
    selected.removeLast()
    selectVirus(curr: curr+1)
}

func infectTime(_ virus: [Point]) -> Int {
    var queue = virus
    var dist = [[Int]](repeating: [Int](repeating: -1, count: nm[0]), count: nm[0])
    queue.forEach { dist[$0.r][$0.c] = 0 }
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        
        for next in nexts(curr) where isInRange(next) && map[next.r][next.c] != 1 {
            guard dist[next.r][next.c] < 0 else { continue }
            queue.append(next)
            dist[next.r][next.c] = dist[curr.r][curr.c] + 1
        }
    }
    
    var maxTime = 0
    for r in 0..<nm[0] {
        for c in 0..<nm[0] {
            guard map[r][c] == 0 else { continue }
            if dist[r][c] == -1 {
                return -1
            } else if maxTime < dist[r][c] {
                maxTime = dist[r][c]
            }
        }
    }
    
    return maxTime
}

selectVirus(curr: 0)
print(minimumTime)
