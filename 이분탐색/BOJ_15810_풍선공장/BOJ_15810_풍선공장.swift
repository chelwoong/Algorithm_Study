
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let staff = readLine()!.split(separator: " ").map { Int(String($0))! }

var low = 0
var high = nm[1] * staff.min()!

func numberOfBalloon(at time: Int) -> Int {
    staff.reduce(0, { $0 + time / $1 })
}

while low < high {
    let mid = (low + high)/2
    if nm[1] <= numberOfBalloon(at: mid) {
        high = mid
    } else {
        low = mid + 1
    }
}

print(low)
