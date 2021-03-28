
import Foundation

// 14503 로봇청소기
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let rcd = readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
for _ in 0..<nm[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

typealias Point = (r: Int, c: Int)
enum Direction: Int {
    case up = 0, right, down , left
    
    mutating func turnLeft() {
        switch self {
            case .up: self = .left
            case .left: self = .down
            case .down: self = .right
            case .right: self = .up
        }
    }
}

var currentDir = Direction(rawValue: rcd[2])!
var currentPoint = Point(rcd[0], rcd[1])
var front: Point {
    switch currentDir {
        case .up: return (currentPoint.r-1, currentPoint.c)
        case .left: return (currentPoint.r, currentPoint.c-1)
        case .down: return (currentPoint.r+1, currentPoint.c)
        case .right: return (currentPoint.r, currentPoint.c+1)
    }
}
var back: Point {
    switch currentDir {
        case .up: return (currentPoint.r+1, currentPoint.c)
        case .left: return (currentPoint.r, currentPoint.c+1)
        case .down: return (currentPoint.r-1, currentPoint.c)
        case .right: return (currentPoint.r, currentPoint.c-1)
    }
}

var cleanCount = 0

func availableNextClean() -> Bool {
    for _ in 0..<4 {
        currentDir.turnLeft()
        if map[front.r][front.c] == 0 {
            currentPoint = front
            return true
        }
    }
    return false
}

func runCleaner() {
    while map[currentPoint.r][currentPoint.c] != 1 {
        if map[currentPoint.r][currentPoint.c] == 0 {
            map[currentPoint.r][currentPoint.c] = 2
            cleanCount += 1
        }
        
        if !availableNextClean() {
            currentPoint = back
        }
    }
}

runCleaner()
print(cleanCount)
