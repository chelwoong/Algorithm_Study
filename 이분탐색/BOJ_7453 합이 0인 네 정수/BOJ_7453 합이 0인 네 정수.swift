
var a = [Int]()
var b = [Int]()
var c = [Int]()
var d = [Int]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    a.append(arr[0])
    b.append(arr[1])
    c.append(arr[2])
    d.append(arr[3])
}

var ab = [Int]()
var cd = [Int]()

for i in 0..<n {
    for j in 0..<n {
        ab.append(a[i] + b[j])
        cd.append(c[i] + d[j])
    }
}
ab.sort(by: <)
cd.sort(by: <)

var low = 0
var high = cd.count-1

var zeroCase = 0
while low < ab.count, high >= 0 {
    let sum = ab[low] + cd[high]
    var abDuplicate = 0
    var cdDuplicate = 0
    if sum == 0 {
        let abSum = ab[low]
        let cdSum = cd[high]
        while low < ab.count, ab[low] == abSum {
            abDuplicate += 1
            low += 1
        }
        
        while high >= 0, cd[high] == cdSum {
            cdDuplicate += 1
            high -= 1
        }
        
        zeroCase += abDuplicate * cdDuplicate
    } else if sum < 0 {
        low += 1
    } else {
        high -= 1
    }
}

print(zeroCase)
