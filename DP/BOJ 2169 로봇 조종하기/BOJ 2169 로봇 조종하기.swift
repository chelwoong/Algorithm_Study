
typealias Point = (row: Int, col: Int)
let moving = [[1, 0], [0, -1], [0, 1]]
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var dpMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
dpMap[0][0] = map[0][0]
for col in 1..<m {
    dpMap[0][col] = dpMap[0][col-1] + map[0][col]
}

for row in 1..<n {
    // from left
    dpMap[row][0] = dpMap[row-1][0] + map[row][0]
    for col in 1..<m {
        dpMap[row][col] = max(dpMap[row-1][col] + map[row][col], dpMap[row][col-1] + map[row][col])
    }
    
    // from right
    guard row < n-1 else { break }
    var temp = [Int](repeating: 0, count: m)
    temp[m-1] = dpMap[row-1][m-1] + map[row][m-1]
    for col in (0..<m-1).reversed() {
        temp[col] = max(dpMap[row-1][col] + map[row][col], temp[col+1] + map[row][col])
    }
    
    for col in 0..<m {
        if temp[col] > dpMap[row][col] {
            dpMap[row][col] = temp[col]
        }
    }
}

print(dpMap[n-1][m-1])

// 백트래킹 시간초과
//
//var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
//func explore(at point: Point) -> (Int, Bool) {
//    let currentCost = map[point.row][point.col]
//    var maxCost = currentCost
//    var sendFromEnd = point.row == n-1 && point.col == m-1
//
//    for move in moving {
//        let nr = point.row + move[0], nc = point.col + move[1]
//        guard nr >= 0, nr < n, nc >= 0, nc < m, !visit[nr][nc] else { continue }
//        visit[point.row][point.col] = true
//        let (cost, fromEnd) = explore(at: (nr, nc))
//        if fromEnd {
//            sendFromEnd = fromEnd
//            maxCost = max(maxCost, currentCost + cost)
//        }
//        visit[point.row][point.col] = false
//    }
//
//
//    return (maxCost, sendFromEnd)
//}
//
//print(explore(at: (0, 0)).0)
