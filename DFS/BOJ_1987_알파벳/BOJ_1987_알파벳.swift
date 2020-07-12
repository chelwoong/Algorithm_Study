let n = readLine()!.split(separator: " ").map{ Int($0)! }
var board = [[Character]]()
for _ in 0..<n[0] {
    board.append(Array(readLine()!))
}

typealias Point = (row: Int, col: Int)

var dr = [-1, 1, 0, 0]
var dc = [0, 0, -1, 1]

func isInRange(at point: Point) -> Bool {
    return 0..<board.count ~= point.row && 0..<board[0].count ~= point.col
}

var maxMoved = 0
func move(at current: Point, visit: Set<Character>) {
    maxMoved = max(maxMoved, visit.count)
    for i in 0..<4 {
        let next = Point(row: current.row + dr[i], col: current.col + dc[i])
        guard isInRange(at: next) else { continue }
        if !visit.contains(board[next.row][next.col]) {
            var visited = visit
            visited.insert(board[next.row][next.col])
            move(at: next, visit: visited)
        }
    }
}

move(at: Point(row: 0, col: 0), visit: Set<Character>([board[0][0]]))
print(maxMoved)
