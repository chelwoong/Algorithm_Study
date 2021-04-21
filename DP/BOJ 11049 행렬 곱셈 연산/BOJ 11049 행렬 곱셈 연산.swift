typealias Metrix = (n: Int, m: Int)

func multiple(_ a: Metrix, _ b: Metrix) -> (Int, Metrix) {
    guard a.m == b.n else { fatalError("Invalid Metrix, \(a), \(b)") }
    return (a.n * a.m * b.m, Metrix(a.n, b.m))
}

let N = Int(readLine()!)!
var metrices = [Metrix]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    metrices.append((input[0], input[1]))
}

for d in 1..<N {
    for start in 0..<N-d {
        let end = start + d
        var result = Int.max
        for mid in start..<end {
            result = min(result, dp[start][mid] + dp[mid+1][end] + metrices[start].n * metrices[mid].m * metrices[end].m)
        }
        dp[start][end] = result
    }
}

print(dp[0][N-1])
