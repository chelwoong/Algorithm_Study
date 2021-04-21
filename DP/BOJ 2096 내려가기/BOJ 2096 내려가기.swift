let n = Int(readLine()!)!
var num = [[Int]]()

for _ in 0..<n {
    num.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var maxDp = num.last!
var minDp = num.last!

for row in num.dropLast().reversed() {
    var maxTmp = [Int](repeating: 0, count: 3)
    var minTmp = [Int](repeating: 0, count: 3)
    maxTmp[0] = row[0] + max(maxDp[0], maxDp[1])
    maxTmp[1] = row[1] + maxDp.max()!
    maxTmp[2] = row[2] + max(maxDp[1], maxDp[2])
    maxDp = maxTmp
    
    minTmp[0] = row[0] + min(minDp[0], minDp[1])
    minTmp[1] = row[1] + minDp.min()!
    minTmp[2] = row[2] + min(minDp[1], minDp[2])
    minDp = minTmp
}

print(maxDp.max()!, minDp.min()!)
