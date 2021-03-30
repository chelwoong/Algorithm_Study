
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }

typealias Product = (w: Int, v: Int)
var products = [Product]()

for _ in 0..<nk[0] {
    let d = readLine()!.split(separator: " ").map { Int(String($0))! }
    products.append((d[0], d[1]))
}

var knapDP = [Int](repeating: 0, count: nk[1]+1)

for (weight, value) in products {
    guard weight < knapDP.count else { continue }
    
    var temp = knapDP
    for k in weight..<knapDP.count {
        let newWeight = k-weight > 0 ? knapDP[k-weight] + value : value
        if knapDP[k] < newWeight {
            temp[k] = newWeight
        }
    }
    knapDP = temp
}

print(knapDP.last!)


