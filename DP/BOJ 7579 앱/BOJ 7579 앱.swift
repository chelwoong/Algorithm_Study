
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let activeMemory = readLine()!.split(separator: " ").map { Int(String($0))! }
let inActiveCost = readLine()!.split(separator: " ").map { Int(String($0))! }
let maxCost = inActiveCost.reduce(0, +)
var dp = [Int](repeating: 0, count: maxCost+1)

for app in 0..<n {
    for cost in (inActiveCost[app]...maxCost).reversed() {
        dp[cost] = max(dp[cost], dp[cost-inActiveCost[app]] + activeMemory[app])
    }
}

for cost in 0...maxCost {
    if dp[cost] >= m {
        print(cost)
        break
    }
}
