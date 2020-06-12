let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map {Int($0)!}

var remain = 0
var order = [Int](repeating: -1, count: n)

for i in 0..<n {
    var taller = seq[i]
    for j in 0..<n {
        //print(i, j, taller, order[j])
        if taller <= 0, order[j] == -1 {
            order[j] = i+1
            break
        } else if order[j] == -1 {
            taller -= 1
        }
    }
}

order.forEach { print($0, terminator: " ") }
