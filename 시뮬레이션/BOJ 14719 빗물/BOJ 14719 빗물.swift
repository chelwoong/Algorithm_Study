
let hw = readLine()!.split(separator: " ").map { Int(String($0))! }
let blocks = readLine()!.split(separator: " ").map { Int(String($0))! }

var leftMax = [Int](repeating: 0, count: blocks.count)
var rightMax = [Int](repeating: 0, count: blocks.count)
leftMax[0] = blocks[0]
rightMax[rightMax.count-1] = blocks.last!

for i in 1..<blocks.count {
    leftMax[i] = max(leftMax[i-1], blocks[i])
}

for i in (0..<blocks.count-1).reversed() {
    rightMax[i] = max(rightMax[i+1], blocks[i])
}

var dropValue = 0
for i in 1..<blocks.count-1 {
    dropValue += min(leftMax[i], rightMax[i]) - blocks[i]
}

print(dropValue)
