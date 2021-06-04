let n = Int(readLine()!)!
var graph = [Int](repeating: 0, count: n)
for i in 0..<n {
    let dest = Int(readLine()!)! - 1
    graph[i] = dest
}

var defaultVisit = (0..<n).map { _ in false }
var visit = defaultVisit

func hasCycle(current idx: Int, from start: Int, count: Int) -> Int {
    guard idx != start else { return count }
    guard !visit[idx] else { return 0 }
    visit[idx] = true
    return hasCycle(current: graph[idx], from: start, count: count+1)
}

for i in 0..<n {
    visit = defaultVisit
    visit[i] = true
    let nodesInCycle = hasCycle(current: graph[i], from: i, count: 1)
    if nodesInCycle > 0 {
        defaultVisit = visit
    }
}

var result = [Int]()
for i in 0..<n {
    if defaultVisit[i] {
        result.append(i+1)
    }
}
print(result.count)
result.forEach { print($0) }
