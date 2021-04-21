let n = Int(readLine()!)!
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

enum Direction: Int {
    case horizontal = 0
    case vertical
    case diagonal
}
typealias Point = (r: Int, c: Int)
typealias Pipe = (Point, Point)

func direction(_ pipe: Pipe) -> Direction {
    if pipe.0.r == pipe.1.r, abs(pipe.0.c - pipe.1.c) == 1 {
        return .horizontal
    } else if pipe.0.c == pipe.1.c, abs(pipe.0.r - pipe.1.r) == 1 {
        return .vertical
    } else {
        return .diagonal
    }
}

func next(_ pipe: Pipe) -> [Pipe] {
    var nextPipes = [Pipe]()
    let dir = direction(pipe)
    
    if dir == .horizontal || dir == .diagonal {
        if 0..<n ~= pipe.1.c+1, map[pipe.1.r][pipe.1.c+1] != 1 {
            nextPipes.append(Pipe(pipe.1, (pipe.1.r, pipe.1.c+1)))
        }
    }
    
    if dir == .vertical || dir == .diagonal {
        if 0..<n ~= pipe.1.r+1, map[pipe.1.r+1][pipe.1.c] != 1 {
            nextPipes.append(Pipe(pipe.1, (pipe.1.r+1, pipe.1.c)))
        }
    }
    
    if 0..<n ~= pipe.1.r+1, 0..<n ~= pipe.1.c+1,
       map[pipe.1.r+1][pipe.1.c] != 1,
       map[pipe.1.r][pipe.1.c+1] != 1,
       map[pipe.1.r+1][pipe.1.c+1] != 1 {
        nextPipes.append(Pipe(pipe.1, (pipe.1.r+1, pipe.1.c+1)))
    }
    
    return nextPipes
}

var dpMap = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 3), count: n), count: n)

func move(_ pipe: Pipe) -> Int {
    let dir = direction(pipe).rawValue
    guard dpMap[pipe.1.r][pipe.1.c][dir] == -1 else { return dpMap[pipe.1.r][pipe.1.c][dir] }
    dpMap[pipe.1.r][pipe.1.c][dir] = 0
    
    if pipe.1.r == n-1, pipe.1.c == n-1 {
        dpMap[pipe.1.r][pipe.1.c][dir] = 1
        return dpMap[pipe.1.r][pipe.1.c][dir]
    }
    
    for p in next(pipe) {
        dpMap[pipe.1.r][pipe.1.c][dir] += move(p)
    }
    
    return dpMap[pipe.1.r][pipe.1.c][dir]
}

print(move(((0,0), (0,1))))
