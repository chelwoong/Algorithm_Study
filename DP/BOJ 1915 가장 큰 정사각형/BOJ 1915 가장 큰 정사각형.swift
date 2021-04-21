
typealias Point = (r: Int, c: Int)
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var map = [[Character]]()

for _ in 0..<n {
    map.append(Array(readLine()!))
}

var size = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

func square(_ p: Point) -> Int {
    guard size[p.r][p.c] == 0 else { return size[p.r][p.c] }
    size[p.r][p.c] = 1
    
    guard p.r+1 < n, p.c+1 < m else { return size[p.r][p.c] }
    
    if map[p.r+1][p.c] == "1", map[p.r][p.c+1] == "1", map[p.r+1][p.c+1] == "1" {
        size[p.r][p.c] = min(square((p.r+1, p.c)), square((p.r, p.c+1)), square((p.r+1, p.c+1))) + 1
    }
    
    return size[p.r][p.c]
}


var maxSize = 0
for r in 0..<n {
    for c in 0..<m where map[r][c] == "1" {
        let s = square((r, c))
        maxSize = max(maxSize, s*s)
    }
}

print(maxSize)
