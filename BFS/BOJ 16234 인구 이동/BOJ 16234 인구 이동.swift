struct Point {
    var r: Int
    var c: Int
    
    init(_ r: Int, _ c: Int) {
        self.r = r
        self.c = c
    }
    
    var nexts: [Point] {
        return [
            Point(r+1, c),
            Point(r-1, c),
            Point(r, c+1),
            Point(r, c-1)
        ]
    }
}

let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
for _ in 0..<nlr[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let range = nlr[1]...nlr[2]
var union = 0
var visited = [[Bool]]()
var tempMap = [[Int]]()

func setParty(_ p: Point) {
    var queue: [Point] = [p]
    visited[p.r][p.c] = true
    var sum = map[p.r][p.c]
    var partyCount = 1
    var member = [Point]()
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        member.append(curr)
        
        for next in curr.nexts where 0..<nlr[0] ~= next.r && 0..<nlr[0] ~= next.c {
            guard !visited[next.r][next.c] else { continue }
            if range ~= abs(map[curr.r][curr.c] - map[next.r][next.c]) {
                visited[next.r][next.c] = true
                queue.append(next)
                sum += map[next.r][next.c]
                partyCount += 1
            }
        }
    }
    
    for p in member {
        tempMap[p.r][p.c] = sum / partyCount
    }
}

while true {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: nlr[0]), count: nlr[0])
    tempMap = map
    
    for r in 0..<nlr[0] {
        for c in 0..<nlr[0] {
            guard !visited[r][c] else { continue }
            setParty(Point(r, c))
        }
    }
    
    if tempMap == map {
        break
    } else {
        union += 1
        map = tempMap
    }
}

print(union)
