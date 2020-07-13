extension Int {
    func prime(n: Int) -> Int {
        var prime = 1
        for _ in 0..<n {
            prime *= self
        }
        return prime
    }
}

let s = readLine()!
let count = s.count
let num = Int(s)!
var result = 0
result += (num - (10.prime(n: count-1))+1) * count
for decimal in 1..<count {
    result += (decimal * 9 * (10.prime(n: decimal-1)))
}

print(result)
