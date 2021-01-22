import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var parents = Array(0...input[0])

func parent(of i: Int) -> Int {
    guard parents[i] != i else { return i }
    parents[i] = parent(of: parents[i])
    return parents[i]
}

func union(_ a: Int, _ b: Int) {
    let aParent = parent(of: a)
    let bParent = parent(of: b)
    guard aParent != bParent else { return }
    parents[bParent] = aParent
}

for _ in 0..<input[1] {
    let order = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = order[1]
    let b = order[2]
    
    if order[0] == 0 {
        guard a != b else { continue }
        union(a, b)
    } else {
        print(parent(of: a) == parent(of: b) ? "YES" : "NO")
    }
}
