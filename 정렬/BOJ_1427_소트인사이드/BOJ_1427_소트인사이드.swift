var str = Array(readLine()!).map{String($0)}
str.sort(by: >)
var n = str.reduce("", +)
print(n)
