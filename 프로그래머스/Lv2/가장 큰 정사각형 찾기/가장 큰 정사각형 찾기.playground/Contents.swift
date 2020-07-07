import Foundation

/*
* 정사각형은 자신 기준 위, 왼쪽, 왼쪽 위가 모두 정사각형
* 세 곳의 최소값이 자신의 사이즈가 됨
*/

func isInRange(row: Int, col: Int, in board: [[Int]]) -> Bool {
    return row < board.count &&
            col < board[0].count &&
            row >= 0 &&
            col >= 0
}

func checkSquare(row: Int, col: Int, in board: inout [[Int]]) -> Int {
    guard isInRange(row: row-1, col: col-1, in: board) else {
        return board[row][col]
    }
    let minSize = min(
        board[row-1][col-1],
        board[row-1][col],
        board[row][col-1]
    )

    board[row][col] = minSize+1
    return board[row][col]
}

func solution(_ board:[[Int]]) -> Int
{
    var sizeBoard = board
    var maxSquare = 0

    for row in 0..<board.count {
        for col in 0..<board[row].count {
            if board[row][col] == 1 {
                maxSquare = max(checkSquare(row: row, col: col, in: &sizeBoard), maxSquare)
            }
        }
    }

    return maxSquare*maxSquare
}
