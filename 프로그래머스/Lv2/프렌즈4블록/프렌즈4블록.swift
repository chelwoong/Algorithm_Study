struct Point {
    var row: Int
    var col: Int
}

func isInRange(at point: Point, in board: [[Character?]]) -> Bool {
    return 0..<board.count ~= point.row && 0..<board[0].count ~= point.col
}

func clear(board: inout [[Character?]], at point: Point, in origin: [[Character?]]) {
    guard isInRange(at: Point(row: point.row+1, col: point.col+1), in: board) else { return }
    let current = origin[point.row][point.col]
    guard
        origin[point.row][point.col+1] == current,
        origin[point.row+1][point.col] == current,
        origin[point.row+1][point.col+1] == current
    else {
        return
    }

    for r in point.row...point.row+1 {
        for c in point.col...point.col+1 {
            board[r][c] = nil
        }
    }
}

func move(board: inout [[Character?]]) {
    for col in 0..<board[0].count {
        for row in (1..<board.count).reversed() {
            guard board[row][col] == nil else { continue }
            for notNilRow in (0..<row).reversed() {
                guard board[notNilRow][col] != nil else { continue }
                board[row][col] = board[notNilRow][col]
                board[notNilRow][col] = nil
                break
            }
        }
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var myBoard = [[Character?]]()
    for row in board {
        myBoard.append(Array(row))
    }

    while true {
        // clear
        var cleared = myBoard
        for row in 0..<myBoard.count {
            for col in 0..<myBoard[row].count {
                guard myBoard[row][col] != nil else { continue }
                let point = Point(row: row, col: col)
                clear(board: &cleared, at: point, in: myBoard)
            }
        }
        if cleared == myBoard { break }

        move(board: &cleared)
        myBoard = cleared
    }

    var clearedCount = 0
    myBoard.forEach {
        clearedCount += $0.filter{$0 == nil}.count
    }
    return clearedCount
}
