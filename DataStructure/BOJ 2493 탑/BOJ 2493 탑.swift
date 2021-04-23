let n = Int(readLine()!)!
let building = readLine()!.split(separator: " ").map { Int(String($0))! }
var received = [Int](repeating: 0, count: n)
var stack = [(idx: Int, top: Int)]()
for (idx, top) in building.enumerated().reversed() {
    while !stack.isEmpty, top >= stack.last!.top  {
        let (i, _) = stack.popLast()!
        received[i] = idx+1
    }
    stack.append((idx, top))
}

print(received.map({ String($0) }).joined(separator: " "))
