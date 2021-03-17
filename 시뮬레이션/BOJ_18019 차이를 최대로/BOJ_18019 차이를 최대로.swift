
import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var maxValue = 0

func diffSum(_ arr: [Int]) -> Int {
    var sum = 0
    for idx in 0..<arr.count-1 {
        sum += abs(arr[idx] - arr[idx+1])
    }
    return sum
}

func perm(_ arr: inout [Int], _ curr: Int) {
    guard curr < n else {
        let sum = diffSum(arr)
        if sum > maxValue {
            print(arr)
            maxValue = sum
        }
        return
    }
    
    for changing in curr..<n {
        arr.swapAt(curr, changing)
        perm(&arr, curr+1)
        arr.swapAt(curr, changing)
    }
}

perm(&numbers, 0)
print(maxValue)
