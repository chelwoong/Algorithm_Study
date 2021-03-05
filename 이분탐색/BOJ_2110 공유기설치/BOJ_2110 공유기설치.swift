
let nc = readLine()!.split(separator: " ").map { Int(String($0))! }
var houses = [Int]()

for _ in 0..<nc[0] {
    houses.append(Int(readLine()!)!)
}
houses.sort(by: <)

var low = 1
var high = houses.last! - houses.first!

func isPossible(dist: Int) -> Bool {
    var count = 1
    var prev = 0
    for i in 1..<houses.count {
        if houses[i] - houses[prev] >= dist {
            count += 1
            prev = i
        }
    }
    
    return count >= nc[1]
}

var maxDist = 1
while low <= high {
    let mid = (low + high)/2
    if isPossible(dist: mid) {
        maxDist = max(maxDist, mid)
        low = mid+1
    } else {
        high = mid-1
    }
}

print(maxDist)

