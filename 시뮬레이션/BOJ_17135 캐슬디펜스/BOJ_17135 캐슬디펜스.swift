import Foundation

// 17135 캐슬디펜스

typealias Point = (r: Int, c: Int)

// 행 열 거리
let nmd = readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
for _ in 0..<nmd[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

map.append([Int](repeating: 0, count: nmd[1]))
var maxPoint = 0

// 궁수 3명 배치

var archers = [Int]()
func addArcher(_ curr: Int) {
    guard archers.count < 3 else {
        let attackPoint = play()
        if maxPoint < attackPoint {
            maxPoint = attackPoint
        }
        return
    }
    
    guard curr < nmd[1] else { return }
    archers.append(curr)
    addArcher(curr+1)
    archers.removeLast()
    addArcher(curr+1)
}

func play() -> Int {
    var playingMap = map
    var attackPoint = 0
    var attackRow = nmd[0]
    var attacked = [Point]()
    while attackRow > 0 {
        for archer in archers {
            for point in validRange(at: (attackRow, archer)) {
                if playingMap[point.r][point.c] == 1 {
                    attacked.append(point)
                    break
                }
            }
        }
        while !attacked.isEmpty {
            let point = attacked.popLast()!
            if playingMap[point.r][point.c] == 1 {
                playingMap[point.r][point.c] = 0
                attackPoint += 1
            }
        }
        attackRow -= 1
    }
    
    return attackPoint
}

func isInRange(_ p: Point) -> Bool {
    return 0..<nmd[0] ~= p.r && 0..<nmd[1] ~= p.c
}

func validRange(at archer: Point) -> [Point] {
    guard nmd[2] > 1 else { return [(archer.r-1, archer.c)] }
    var validPoints = [(archer.r-1, archer.c)]
    let dist = nmd[2]
    
    for d in 2...dist {
        (archer.c - (d-1)...archer.c + (d-1)).forEach { col in
            let colDist = abs(archer.c - col)
            let row = archer.r - (d-colDist)
            if isInRange((row, col)) {
                validPoints.append((row, col))
            }
        }
    }
    
    return validPoints
}

addArcher(0)
print(maxPoint)
