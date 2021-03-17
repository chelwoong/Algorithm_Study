
import Foundation

var rc = readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Character]]()
for _ in 0..<rc[0] {
    map.append(Array(readLine()!))
}

typealias Point = (r: Int, c: Int)

func nexts(_ p: Point) -> [Point] {
    return [
        (p.r-1, p.c),
        (p.r+1, p.c),
        (p.r, p.c-1),
        (p.r, p.c+1),
    ]
}

func isInRange(_ p: Point) -> Bool {
    return 0..<rc[0] ~= p.r && 0..<rc[1] ~= p.c
}

func bfs(_ start: Point) -> Int {
    var dist = [[Int]](repeating: [Int](repeating: -1, count: rc[1]), count: rc[0])
    var queue = [Point]()
    queue.append(start)
    dist[start.r][start.c] = 0
    var max = 0
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        if dist[curr.r][curr.c] > max {
            max = dist[curr.r][curr.c]
        }
        for next in nexts(curr) where isInRange(next) && dist[next.r][next.c] < 0 && map[next.r][next.c] == "L" {
            queue.append(next)
            dist[next.r][next.c] = dist[curr.r][curr.c] + 1
        }
    }
    
    return max
}

var longestTime = 0
for r in 0..<rc[0] {
    for c in 0..<rc[1] {
        guard map[r][c] == "L" else { continue }
        let time = bfs((r, c))
        if longestTime < time {
            longestTime = time
        }
    }
}
print(longestTime)
