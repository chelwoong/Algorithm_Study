let nm = readLine()!.split(separator: " ").map{Int($0)!}
var board = [[Int]]()
for _ in 0..<nm[0] {
    board.append(readLine()!.split(separator: " ").map({Int($0)!}))
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: nm[1]), count: nm[0])
    
typealias Point = (r: Int, c: Int)
let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
var maximum = 0

func isInRange(at point: Point) -> Bool {
    return 0..<board.count ~= point.r && 0..<board[0].count ~= point.c
}

// 길이 4 dfs
func checkDfs(at point: Point, value: Int, selectedCount: Int) {
    let current = board[point.r][point.c]
    //print("\(point) value: \(value), current: \(current), selected: \(selectedCount)")
    if selectedCount == 3 {
        maximum = max(maximum, value + current)
        return
    }
    
    for i in 0..<4 {
        let next = Point(point.r + dr[i], point.c + dc[i])
        if isInRange(at: next) {
            guard !visited[next.r][next.c] else { continue }
            visited[next.r][next.c] = true
            checkDfs(at: next, value: value+current, selectedCount: selectedCount+1)
            visited[next.r][next.c] = false
        }
    }
}

// ㅗ 모양 탐색
func checkEtc(at point: Point) {
    // ㅓ, ㅏ
    if isInRange(at: Point(r: point.r+2, c: point.c)) {
        var maxTemp = 0
        for r in point.r...point.r+2 {
            maxTemp += board[r][point.c]
        }
        if isInRange(at: Point(r: point.r+1, c: point.c+1)) {
            maximum = max(maximum, maxTemp + board[point.r+1][point.c+1])
        }
        if isInRange(at: Point(r: point.r+1, c: point.c-1)) {
            maximum = max(maximum, maxTemp + board[point.r+1][point.c-1])
        }
    }
    
    // ㅗ, ㅜ
    if isInRange(at: Point(r: point.r, c: point.c+2)) {
        var maxTemp = 0
        for c in point.c...point.c+2 {
            maxTemp += board[point.r][c]
        }
        if isInRange(at: Point(r: point.r-1, c: point.c+1)) {
            maximum = max(maximum, maxTemp + board[point.r-1][point.c+1])
        }
        if isInRange(at: Point(r: point.r+1, c: point.c+1)) {
            maximum = max(maximum, maxTemp + board[point.r+1][point.c+1])
        }
    }
}

for r in 0..<board.count {
    for c in 0..<board[0].count {
        let curr = Point(r: r, c: c)
        visited[curr.r][curr.c] = true
        checkDfs(at: curr, value: 0, selectedCount: 0)
        visited[curr.r][curr.c] = false
        checkEtc(at: curr)
    }
}

print(maximum)
