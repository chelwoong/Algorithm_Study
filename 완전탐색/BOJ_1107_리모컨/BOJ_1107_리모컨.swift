let strN = readLine()!
let n = Int(strN)!
var failures = Set<Int>()
if Int(readLine()!)! != 0 {
    failures = Set<Int>(readLine()!.split(separator: " ").map({Int($0)!}))
}
var minOrder = abs(n - 100)

func makeAllNumbers(num: String) {
    if num.count >= 6 {
        return
    }
    
    for i in 0..<10 {
        if failures.contains(i) {
            continue
        } else {
            let orderCount = abs(n - Int(num + String(i))!) + num.count+1
            minOrder = min(minOrder, orderCount)
            makeAllNumbers(num: num+String(i))
        }
    }
}
makeAllNumbers(num: "")
print(minOrder)
