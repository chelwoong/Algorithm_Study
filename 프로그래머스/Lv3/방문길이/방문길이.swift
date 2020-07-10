import Foundation

// MARK: 개선된 풀이

typealias Point = (row: Int, col: Int)
var moved = Set<String>()

func canMove(at point: Point) -> Bool {
    return -5...5 ~= point.row && -5...5 ~= point.col
}

func move(at current: inout Point, order: Character) {
    var row = current.row
    var col = current.col
    switch order {
        case "U": row -= 1
        case "D": row += 1
        case "R": col += 1
        case "L": col -= 1
        default: break
    }
    guard canMove(at: (row: row, col: col)) else { return }
    let next = Point(row: row, col: col)
    moved.insert("\(current)\(next)")
    current = next
}

func solution(_ dirs:String) -> Int {
    var current = Point(row: 0, col: 0)
    dirs.forEach {
        move(at: &current, order: $0)
    }
    
    return moved.count
}

// MARK: - 처음 풀이

struct Point {
    var row: Int
    var col: Int
}

func isInRange(at point: Point) -> Bool {
    return 0...10 ~= point.row && 0...10 ~= point.col
}

func move(at point: Point, order: Character) -> Point {
    switch order {
        case "U": return Point(row: point.row-1, col: point.col)
        case "D": return Point(row: point.row+1, col: point.col)
        case "R": return Point(row: point.row, col: point.col+1)
        case "L": return Point(row: point.row, col: point.col-1)
        default: return point
    }
}

func solution(_ dirs:String) -> Int {
    var board = [[Set<Character>]](repeating: [Set<Character>](repeating: Set<Character>(), count: 11), count: 11)
    var newPointCount = 0
    
    var current = Point(row: 5, col: 5)
    for dir in dirs {
        let next = move(at: current, order: dir)
        guard isInRange(at: next) else { continue }
        if !board[current.row][current.col].contains(dir) {
            newPointCount += 1
            board[current.row][current.col].insert(dir)
            switch dir {
                case "U": board[next.row][next.col].insert("D")
                case "D": board[next.row][next.col].insert("U")
                case "R": board[next.row][next.col].insert("L")
                case "L": board[next.row][next.col].insert("R")
                default: break
            }
        }
        current = next
    }
    
    return newPointCount
}
