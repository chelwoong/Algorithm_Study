let ns = readLine()!
let count = ns.count
let n = Int(ns)!
var haveCreator = false

func makeCreator(_ number: Int) -> Int {
    var number = number
    var creator = number
    while number > 0 {
        creator += (number % 10)
        number /= 10
    }
    return creator
}

for i in n - (count*9)...n {
    if makeCreator(i) == n {
        print(i)
        haveCreator = true
        break
    }
}

if !haveCreator {
    print(0)
}
