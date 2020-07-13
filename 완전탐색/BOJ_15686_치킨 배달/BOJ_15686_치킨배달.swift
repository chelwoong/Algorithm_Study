
let nm = readLine()!.split(separator: " ").map{Int($0)!}
var board = [[Int]]()
for _ in 0..<nm[0] {
    board.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

typealias Point = (r: Int, c: Int)
var homePoints = [Point]()
var chickenPoints = [Point]()

for r in 0..<board.count {
    for c in 0..<board[0].count {
        if board[r][c] == 1 {
            homePoints.append(Point(r: r, c: c))
        } else if board[r][c] == 2 {
            chickenPoints.append(Point(r: r, c: c))
        }
    }
}

var selected = [Bool](repeating: false, count: chickenPoints.count)
var minimumDistance = Int.max
func selectChickens(idx: Int, selectedCount: Int) {
    if selectedCount == nm[1] {
        minimumDistance = min(minimumDistance, findDistance())
    }
    if idx >= chickenPoints.count {
        return
    }
    
    selected[idx] = true
    selectChickens(idx: idx+1, selectedCount: selectedCount+1)
    selected[idx] = false
    selectChickens(idx: idx+1, selectedCount: selectedCount)
}

func findDistance() -> Int {
    var minDistance = 0
    for home in homePoints {
        var distance = Int.max
        for (idx, chicken) in chickenPoints.enumerated() {
            if selected[idx] {
                distance = min(distance, abs(home.r - chicken.r) + abs(home.c - chicken.c))
            }
        }
        minDistance += distance
    }
    return minDistance
}

selectChickens(idx: 0, selectedCount: 0)
print(minimumDistance)
