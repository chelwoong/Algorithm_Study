
// 12100 2048(easy)

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
    
    var rotateCountToBeLeft: Int {
        switch self {
            case .up: return 3
            case .down: return 1
            case .left: return 0
            case .right: return 2
        }
    }
}

func rotateRightAngle(_ metrix: [[Int]]) -> [[Int]] {
    let rowSize = metrix.count
    let colSize = metrix[0].count
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: rowSize), count: colSize)
    
    for r in 0..<rowSize {
        for c in 0..<colSize {
            rotated[c][rowSize-r-1] = metrix[r][c]
        }
    }
    return rotated
}

func tilt(_ metrix: [[Int]], to dir: Direction) -> [[Int]] {
    var tilted = metrix
    (0..<dir.rotateCountToBeLeft).forEach { _ in
        tilted = rotateRightAngle(tilted)
    }
    
    for row in tilted.indices {
        var mixed = [Int](repeating: 0, count: tilted[row].count)
        var movingPoint = 0
        
        for r in tilted[row] {
            guard r != 0 else { continue }
            if mixed[movingPoint] == 0 {
                mixed[movingPoint] = r
            } else if mixed[movingPoint] == r {
                mixed[movingPoint] *= 2
                movingPoint += 1
            } else {
                movingPoint += 1
                mixed[movingPoint] = r
            }
        }
        
        tilted[row] = mixed
    }
    
    (0..<(4-dir.rotateCountToBeLeft) % 4).forEach { _ in
        tilted = rotateRightAngle(tilted)
    }
    return tilted
}

let n = Int(readLine()!)!
var metrix = [[Int]]()

for _ in 0..<n {
    metrix.append(readLine()!.split(separator: " ").map({ Int($0)! }))
}

var maxCount = 0
func searchMax(_ metrix: [[Int]], count: Int) {
    guard count < 5 else {
        metrix.forEach {
            $0.forEach {
                maxCount = max(maxCount, $0)
            }
        }
        return
    }
    
    for dir in Direction.allCases {
        let tilted = tilt(metrix, to: dir)
        searchMax(tilted, count: count+1)
    }
}

searchMax(metrix, count: 0)
print(maxCount)
