let n = Int(readLine()!)!
var weight = [Int]()
var height = [Int]()
var result = [Int]()

for _ in 0..<n {
    let p = readLine()!.split(separator: " ").map{Int($0)!}
    weight.append(p[0])
    height.append(p[1])
}

for me in 0..<n {
    var bigger = 0
    for i in 0..<n {
        guard me != i else { continue }
        if weight[me] < weight[i], height[me] < height[i] {
            bigger += 1
        }
    }
    result.append(bigger+1)
}

result.forEach { print($0, terminator: " ") }
