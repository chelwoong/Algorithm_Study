let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0, right = numbers.reduce(0, +)

func isValid(_ maxValue: Int) -> Bool {
    var low = numbers[0], high = numbers[0]
    var count = 1
    for num in numbers {
        if num < low {
            low = num
        }
        if num > high {
            high = num
        }
        if (high - low) > maxValue {
            count += 1
            low = num
            high = num
        }
    }
    return count <= m
}

var minSegmentMax = right
while left <= right {
    let mid = (left + right) / 2
    if isValid(mid) {
        right = mid-1
        minSegmentMax = min(minSegmentMax, mid)
    } else {
        left = mid+1
    }
}

print(minSegmentMax)
