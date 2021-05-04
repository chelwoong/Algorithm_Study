
let n = Int(readLine()!)!
var solution = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = [solution[0], solution[n-1]]
var left = 0
var right = n-1
var minSum = abs(solution[left] + solution[right])

while left < right {
    if minSum > abs(solution[left] + solution[right]) {
        minSum = abs(solution[left] + solution[right])
        result[0] = solution[left]
        result[1] = solution[right]
    }
    if abs(solution[left+1] + solution[right]) < abs(solution[left] + solution[right-1]) {
        left += 1
    } else {
        right -= 1
    }
}

print("\(result[0]) \(result[1])")
