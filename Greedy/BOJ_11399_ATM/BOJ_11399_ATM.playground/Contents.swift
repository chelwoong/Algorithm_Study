let n = Int(readLine()!)!
var waitTimes = readLine()!.split(separator: " ").map { Int(String($0))! }
waitTimes.sort(by: <)

var result = 0
var sum = 0
for time in waitTimes {
    sum += time
    result += sum
}
print(result)
