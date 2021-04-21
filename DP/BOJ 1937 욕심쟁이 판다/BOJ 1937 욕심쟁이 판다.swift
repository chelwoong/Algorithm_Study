import Foundation

typealias Point = (r: Int, c: Int)
let n = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var dpMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

var dr = [1, -1, 0, 0]
var dc = [0, 0, 1, -1]

func dfs(_ curr: Point) -> Int {
    guard dpMap[curr.r][curr.c] == 0 else { return dpMap[curr.r][curr.c] }
    dpMap[curr.r][curr.c] = 1
    for d in 0..<4 where 0..<n ~= curr.r + dr[d] && 0..<n ~= curr.c + dc[d] {
        let next = Point(curr.r + dr[d], curr.c + dc[d])
        guard map[next.r][next.c] > map[curr.r][curr.c] else { continue }
        dpMap[curr.r][curr.c] = max(dpMap[curr.r][curr.c], dfs(next) + 1)
    }
    
    return dpMap[curr.r][curr.c]
}

var maxLife = 0
for r in 0..<n {
    for c in 0..<n {
        maxLife = max(maxLife, dfs((r, c)))
    }
}

print(maxLife)
