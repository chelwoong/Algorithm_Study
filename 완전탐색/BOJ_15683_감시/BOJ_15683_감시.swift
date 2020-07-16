let nm = readLine()!.split(separator: " ").map{Int($0)!}
var board = [[Int]]()
for _ in 0..<nm[0] {
    board.append(readLine()!.split(separator: " ").map({Int($0)!}))
}
var minBlindArea = Int.max
typealias CCTV = (r: Int, c: Int, type: Int)
enum Direction {
    case up
    case down
    case right
    case left
}
var cctvList = [CCTV]()

for r in 0..<board.count {
    for c in 0..<board[0].count {
        if board[r][c] == 0 || board[r][c] == 6 { continue }
        cctvList.append(CCTV(r: r, c: c, type: board[r][c]))
    }
}

func makeSafeArea(row: Int, col: Int, direction: Direction, board: [[Int]]) -> [[Int]] {
    var r = row
    var c = col
    var board = board
    
    switch direction {
    case .up:
        while 0..<board.count ~= r-1  {
            r -= 1
            if board[r][c] == 6 {
                return board
            } else if board[r][c] == 0 {
                board[r][c] = -1
            } else {
                continue
            }
        }
        return board
    case .down:
        while 0..<board.count ~= r+1  {
            r += 1
            if board[r][c] == 6 {
                return board
            } else if board[r][c] == 0 {
                board[r][c] = -1
            } else {
                continue
            }
        }
        return board
    case .left:
        while 0..<board[0].count ~= c-1  {
            c -= 1
            if board[r][c] == 6 {
                return board
            } else if board[r][c] == 0 {
                board[r][c] = -1
            } else {
                continue
            }
        }
        return board
    case .right:
        while 0..<board[0].count ~= c+1  {
            c += 1
            if board[r][c] == 6 {
                return board
            } else if board[r][c] == 0 {
                board[r][c] = -1
            } else {
                continue
            }
        }
        return board
    }
}

func checked(cctv: CCTV, board: [[Int]]) -> [[[Int]]] {
    var boards = [[[Int]]]()
    switch cctv.type {
    case 1:
        boards.append(makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: board))
        boards.append(makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: board))
        boards.append(makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: board))
        boards.append(makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: board))
    case 2:
        var leftBoard = board
        leftBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: leftBoard)
        leftBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: leftBoard)
        boards.append(leftBoard)
        
        var upDownBoard = board
        upDownBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: upDownBoard)
        upDownBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: upDownBoard)
        boards.append(upDownBoard)
    case 3:
        var tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        boards.append(tempBoard)
    case 4:
        var tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        boards.append(tempBoard)
        
        tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        boards.append(tempBoard)
    case 5:
        var tempBoard = board
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .left, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .up, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .right, board: tempBoard)
        tempBoard = makeSafeArea(row: cctv.r, col: cctv.c, direction: .down, board: tempBoard)
        boards.append(tempBoard)
    default: break
    }
    return boards
}

func check(index: Int, board origin: [[Int]]) {
    if index >= cctvList.count {
        var blind = 0
        for row in origin {
            blind += row.filter({ $0 == 0 }).count
        }
        minBlindArea = min(minBlindArea, blind)
        return
    }
    
    let cctv = cctvList[index]
    for board in checked(cctv: cctv, board: origin) {
        check(index: index+1, board: board)
    }
}
check(index: 0, board: board)
print(minBlindArea)
