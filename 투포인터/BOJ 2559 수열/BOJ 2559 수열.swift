
import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])

var degree = readLine()!.split(separator: " ").map { Int(String($0))! }

var sum = (0..<k).reduce(into: 0, { $0 += degree[$1] })
var maxSum = sum

for i in k..<n {
    sum += -degree[i-k] + degree[i]
    maxSum = max(maxSum, sum)
}

print(maxSum)
