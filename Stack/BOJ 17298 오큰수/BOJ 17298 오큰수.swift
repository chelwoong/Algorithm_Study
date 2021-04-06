

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [String](repeating: "-1", count: n)
var notFindIndices = [Int]()

for i in 0..<n {
    while !notFindIndices.isEmpty, a[notFindIndices.last!] < a[i] {
        let index = notFindIndices.popLast()!
        result[index] = "\(a[i])"
    }
    
    notFindIndices.append(i)
}

print(result.joined(separator: " "))
