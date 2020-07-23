/*
 13460 구슬 탈출2
 */

let nm = readLine()!.split(separator: " ").map{Int($0)!}
var board = [[Character]]()
var minimumTry = Int.max
typealias Point = (r: Int, c: Int)
var redPoint = Point(r: 0, c: 0)
var bluePoint = Point(r: 0, c: 0)
var holePoint = Point(r: 0, c: 0)

for r in 0..<nm[0] {
    let row = Array(readLine()!)
    board.append(row)
    
    if let c = row.firstIndex(of: "B") {
        bluePoint = Point(r: r, c: c)
        board[r][c] = "."
    }
    if let c = row.firstIndex(of: "R") {
        redPoint = Point(r: r, c: c)
        board[r][c] = "."
    }
    if let c = row.firstIndex(of: "O") {
        holePoint = Point(r: r, c: c)
    }
}

enum Direction {
    case up
    case down
    case right
    case left
    
    func move(from p: Point) -> Point {
        switch self {
            case .up: return Point(r: p.r-1, c: p.c)
            case .down: return Point(r: p.r+1, c: p.c)
            case .right: return Point(r: p.r, c: p.c+1)
            case .left: return Point(r: p.r, c: p.c-1)
        }
    }
    func back(from p: Point) -> Point {
        switch self {
            case .up: return Point(r: p.r+1, c: p.c)
            case .down: return Point(r: p.r-1, c: p.c)
            case .right: return Point(r: p.r, c: p.c-1)
            case .left: return Point(r: p.r, c: p.c+1)
        }
    }
    
    static var all: [Direction] {
        return [.up, .down, .right, .left]
    }
}

func explore(tryCount: Int, red rPoint: Point, blue bPoint: Point, direction dir: Direction) {
    guard tryCount < 10 else { return }

    var movedRed = rPoint
    var movedBlue = bPoint
    
    while board[movedRed.r][movedRed.c] == "." {
        movedRed = dir.move(from: movedRed)
        
        // 이동 방향에 bPoint가 있었으면 hole에 도달하지 못했을 것이므로
        // 도달했으면 성공
        if movedRed == holePoint {
            break
        }
    }
    if board[movedRed.r][movedRed.c] == "#" {
        movedRed = dir.back(from: movedRed)
    }
    
    while board[movedBlue.r][movedBlue.c] == "." {
        movedBlue = dir.move(from: movedBlue)

        if movedBlue == holePoint {
            return
        }
    }
    if board[movedBlue.r][movedBlue.c] == "#" {
        movedBlue = dir.back(from: movedBlue)
    }
    
    if movedRed == holePoint {
        minimumTry = min(minimumTry, tryCount+1)
        return
    }
    
    // 두 구슬 모두 움직임이 없다면 return
    if movedBlue == bPoint, movedRed == rPoint {
        return
    }
    
    // 겹친다면,
    if movedRed == movedBlue {
        var rBack = true
        switch dir {
            case .up:
                rBack = rPoint.r > bPoint.r
            case .down:
                rBack = rPoint.r < bPoint.r
            case .right:
                rBack = rPoint.c < bPoint.c
            case .left:
                rBack = rPoint.c > bPoint.c
        }
        
        if rBack {
            movedRed = dir.back(from: movedRed)
        } else {
            movedBlue = dir.back(from: movedBlue)
        }
    }
    
    
    
    for nextDir in Direction.all {
        if dir == .up, nextDir == .down {
            continue
        } else if dir == .down, nextDir == .up {
            continue
        } else if dir == .right, nextDir == .left {
            continue
        } else if dir == .left, nextDir == .right {
            continue
        }
        explore(tryCount: tryCount+1, red: movedRed, blue: movedBlue, direction: nextDir)
    }
}

for dir in Direction.all {
    explore(tryCount: 0, red: redPoint, blue: bluePoint, direction: dir)
}

minimumTry == Int.max ? print(-1) : print(minimumTry)
