
let rc = readLine()!.split(separator: " ").map { Int(String($0))! }

var map = [[String]]()
for _ in 0..<rc[0] {
    map.append(readLine()!.split(separator: " ").map { String($0) })
}

typealias Point = (r: Int, c: Int)

var unSafeArea = rc[0] * rc[1]

func numberOfUnSafeArea(_ map: [[String]]) -> Int {
    var count = 0
    map.forEach {
        count += $0.filter { $0 == "0" }.count
    }
    return count
}

enum Direction: CaseIterable {
    case up, down, left, right
}

func check(_ p: Point, _ map: inout [[String]], _ dir: Direction) {
    switch dir {
        case .up:
            var next = p.r-1
            while next >= 0 {
                if map[next][p.c] == "0" {
                    map[next][p.c] = "#"
                } else if map[next][p.c] == "6" {
                    break
                }
                next -= 1
            }
        case .down:
            var next = p.r+1
            while next < rc[0] {
                if map[next][p.c] == "0" {
                    map[next][p.c] = "#"
                } else if map[next][p.c] == "6" {
                    break
                }
                next += 1
            }
        case .left:
            var next = p.c-1
            while next >= 0 {
                if map[p.r][next] == "0" {
                    map[p.r][next] = "#"
                } else if map[p.r][next] == "6" {
                    break
                }
                next -= 1
            }
        case .right:
            var next = p.c+1
            while next < rc[1] {
                if map[p.r][next] == "0" {
                    map[p.r][next] = "#"
                } else if map[p.r][next] == "6" {
                    break
                }
                next += 1
            }
    }
}

func checkMap(_ p: Point, _ map: [[String]]) {
    guard p.r < rc[0] else {
        unSafeArea = min(unSafeArea, numberOfUnSafeArea(map))
        return
    }
    
    let next = p.c+1 < rc[1] ? Point(p.r, p.c+1) : Point(p.r+1, 0)
    
    if map[p.r][p.c] == "1" {
        // 전방향 한 번씩
        for dir in Direction.allCases {
            var updatedMap = map
            check(p, &updatedMap, dir)
            checkMap(next, updatedMap)
        }
    } else if map[p.r][p.c] == "2" {
        // 가로
        var updatedMap = map
        check(p, &updatedMap, .left)
        check(p, &updatedMap, .right)
        checkMap(next, updatedMap)
        
        // 세로
        updatedMap = map
        check(p, &updatedMap, .up)
        check(p, &updatedMap, .down)
        checkMap(next, updatedMap)
    } else if map[p.r][p.c] == "3" {
        var updatedMap = map
        check(p, &updatedMap, .up)
        check(p, &updatedMap, .right)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .right)
        check(p, &updatedMap, .down)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .down)
        check(p, &updatedMap, .left)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .left)
        check(p, &updatedMap, .up)
        checkMap(next, updatedMap)
    } else if map[p.r][p.c] == "4" {
        var updatedMap = map
        check(p, &updatedMap, .up)
        check(p, &updatedMap, .right)
        check(p, &updatedMap, .down)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .right)
        check(p, &updatedMap, .down)
        check(p, &updatedMap, .left)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .down)
        check(p, &updatedMap, .left)
        check(p, &updatedMap, .up)
        checkMap(next, updatedMap)
        
        updatedMap = map
        check(p, &updatedMap, .left)
        check(p, &updatedMap, .up)
        check(p, &updatedMap, .right)
        checkMap(next, updatedMap)
    } else if map[p.r][p.c] == "5" {
        var updatedMap = map
        for dir in Direction.allCases {
            check(p, &updatedMap, dir)
        }
        checkMap(next, updatedMap)
    } else {
        checkMap(next, map)
    }
}

checkMap((0, 0), map)
print(unSafeArea)
