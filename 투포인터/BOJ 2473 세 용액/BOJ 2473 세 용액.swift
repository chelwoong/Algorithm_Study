
// MARK: 2473 세 용액

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()

var closeSet = [Int]()
var closeZero = 10_000_000_000

loop: for i in 0..<n-2 {
    var start = i+1
    var end = n-1
    
    while start < end {
        let sum = arr[i] + arr[start] + arr[end]
        if abs(sum) < closeZero {
            closeZero = abs(sum)
            closeSet = [arr[i], arr[start], arr[end]]
        }
        
        if sum == 0 {
            break loop
        } else if sum > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}

print("\(closeSet[0]) \(closeSet[1]) \(closeSet[2])")
