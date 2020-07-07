/*
 BOJ 14052
 */

struct Point {
    var row: Int
    var col: Int
    
    func isInRange(of board: [[Int]]) -> Bool {
        return 0..<board.count ~= row && 0..<board[0].count ~= col
    }
    
    var movedPoint: [Point] {
        return [
            Point(row: row-1, col: col),
            Point(row: row+1, col: col),
            Point(row: row, col: col-1),
            Point(row: row, col: col+1)
        ]
    }
}

let n = readLine()!.split(separator: " ").map { Int($0)!}
var board = [[Int]]()
for _ in 0..<n[0] {
    board.append(readLine()!.split(separator: " ").map{Int($0)!})
}
var maxCountOfSafeArea = 0

func spreadVirus(at point: Point, in board: [[Int]]) -> [[Int]] {
    var spreadedBoard = board
    var virusQueue = [Point]()

    for next in point.movedPoint {
        if next.isInRange(of: board), spreadedBoard[next.row][next.col] == 0 {
            spreadedBoard[next.row][next.col] = 2
            virusQueue.append(next)
        }
    }
    
    while !virusQueue.isEmpty {
        let point = virusQueue.removeFirst()
        for next in point.movedPoint {
            if next.isInRange(of: board), spreadedBoard[next.row][next.col] == 0 {
                spreadedBoard[next.row][next.col] = 2
                virusQueue.append(next)
            }
        }
    }
    return spreadedBoard
}

func spreadVirus(to board: [[Int]]) -> [[Int]] {
    var spreadedBoard = board
    var viruses = [Point]()
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            guard spreadedBoard[row][col] == 2 else { continue }
            viruses.append(Point(row: row, col: col))
        }
    }
    
    viruses.forEach {
        spreadedBoard = spreadVirus(at: $0, in: spreadedBoard)
    }
    return spreadedBoard
}

func checkSafeArea(wallCount: Int, in board: [[Int]]) {
    if wallCount == 3 {
        var numberOfSafeArea = 0
        let spreadedBoard = spreadVirus(to: board)
        spreadedBoard.forEach {
            numberOfSafeArea += $0.filter { $0 == 0 }.count
        }
        maxCountOfSafeArea = max(maxCountOfSafeArea, numberOfSafeArea)
        return
    }
    
    for row in 0..<board.count {
        for col in 0..<board[row].count {
            if board[row][col] == 0 {
                var protectedBoard = board
                protectedBoard[row][col] = 1
                checkSafeArea(wallCount: wallCount+1, in: protectedBoard)
            }
        }
    }
}


for row in 0..<n[0] {
    for col in 0..<n[1] {
        // 여길 첫번째 방벽으로 하고 시작
        if board[row][col] == 0 {
            var protectedBoard = board
            protectedBoard[row][col] = 1
            checkSafeArea(wallCount: 1, in: protectedBoard)
        }
    }
}
print(maxCountOfSafeArea)
