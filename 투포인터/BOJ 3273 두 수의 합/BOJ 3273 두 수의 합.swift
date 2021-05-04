let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
let k = Int(readLine()!)!

var start = 0
var end = arr.count-1
var combi = 0

while start < end {
    if arr[start] + arr[end] == k {
        combi += 1
        start += 1
    } else if arr[start] + arr[end] > k {
        end -= 1
    } else {
        start += 1
    }
}

print(combi)
