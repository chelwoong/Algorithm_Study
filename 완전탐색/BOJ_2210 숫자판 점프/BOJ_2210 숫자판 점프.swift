typealias Point = (r: Int, c: Int)

var board = [[String]]()
var digitSet = Set<String>()

for _ in 0..<5 {
    board.append(readLine()!.split(separator: " ").map { String($0) })
}

func nexts(_ p: Point) -> [Point] {
    return [
        (p.r+1, p.c),
        (p.r-1, p.c),
        (p.r, p.c+1),
        (p.r, p.c-1)
    ].filter { 0..<5 ~= $0.r && 0..<5 ~= $0.c }
}

func jump(_ p: Point, _ digit: String) {
    guard digit.count < 6 else {
        digitSet.insert(digit)
        return
    }
    
    for next in nexts(p) {
        jump(next, digit + board[p.r][p.c])
    }
}

for r in 0..<5 {
    for c in 0..<5 {
        jump((r, c), "")
    }
}

print(digitSet.count)
