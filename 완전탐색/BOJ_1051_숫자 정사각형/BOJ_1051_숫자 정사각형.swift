let nm = readLine()!.split(separator: " ").map({Int($0)!})
var board = [[Character]]()
for _ in 0..<nm[0] {
    board.append(Array(readLine()!))
}

var size = min(nm[0], nm[1])

func checkSquare(r: Int, c: Int, size: Int) -> Bool {
    let n = board[r][c]
    return board[r+size-1][c] == n &&
        board[r][c+size-1] == n &&
        board[r+size-1][c+size-1] == n
}

func findMaxSquare() {
    while size > 1 {
        for r in 0..<board.count {
            guard 0..<board.count ~= r+size-1 else { break }
            for c in 0..<board[0].count {
                guard 0..<board[0].count ~= c+size-1 else { break }
                if checkSquare(r: r, c: c, size: size) {
                    return
                }
            }
        }
        size -= 1
    }
}

findMaxSquare()
print(size*size)
