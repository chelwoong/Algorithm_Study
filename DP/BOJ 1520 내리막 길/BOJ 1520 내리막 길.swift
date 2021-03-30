// 1520 내리막 길

typealias Point = (r: Int, c: Int)
let rc = readLine()!.split(separator: " ").map { Int(String($0))! }

var map = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: -1, count: rc[1]), count: rc[0])
for _ in 0..<rc[0] {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var queue = [Point]()
queue.append((0, 0))

let dr = [-1, 1, 0, 0]
let dc = [0, 0, 1, -1]

func dfs(_ p: Point) -> Int {
    print(p)
    if p.r == rc[0]-1, p.c == rc[1]-1 {
        return 1
    } else if dp[p.r][p.c] == -1 {
        dp[p.r][p.c] = 0
        for d in 0..<4 where 0..<rc[0] ~= p.r + dr[d] && 0..<rc[1] ~= p.c + dc[d] {
            let next = Point(p.r + dr[d], p.c + dc[d])
            if map[next.r][next.c] < map[p.r][p.c] {
                dp[p.r][p.c] += dfs(next)
            }
        }
    }
    
    return dp[p.r][p.c]
}

print(dfs((0, 0)))
