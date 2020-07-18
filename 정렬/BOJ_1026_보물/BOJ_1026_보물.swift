let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var b = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)

var result = 0
for i in 0..<a.count {
    result += a[i] * b[i]
}
print(result)
