let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map { Int(String($0))! }

var aSum = [Int]()
var bSum = [Int]()

for i in 0..<a.count {
    var tempSum = a[i]
    aSum.append(tempSum)
    for j in i+1..<a.count {
        tempSum += a[j]
        aSum.append(tempSum)
    }
}

for i in 0..<b.count {
    var tempSum = b[i]
    bSum.append(tempSum)
    for j in i+1..<b.count {
        tempSum += b[j]
        bSum.append(tempSum)
    }
}

aSum.sort(by: <)
bSum.sort(by: <)

var aIdx = 0
var bIdx = bSum.count-1

var validCase = 0
while aIdx < aSum.count, bIdx >= 0 {
    let sum = aSum[aIdx] + bSum[bIdx]
    if sum == t {
        let validA = aSum[aIdx]
        let validB = bSum[bIdx]
        var duplicatedA = 0
        var duplicatedB = 0
        
        while aIdx < aSum.count, aSum[aIdx] == validA {
            duplicatedA += 1
            aIdx += 1
        }
        
        while bIdx >= 0, bSum[bIdx] == validB {
            duplicatedB += 1
            bIdx -= 1
        }
        
        validCase += duplicatedA * duplicatedB
    } else if sum < t {
        aIdx += 1
    } else {
        bIdx -= 1
    }
}

print(validCase)
