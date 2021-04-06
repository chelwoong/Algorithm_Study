let n = Int(readLine()!)!
var cities = [[(end: Int, value: Int)]](repeating: [], count: n+1)
for _ in 0..<Int(readLine()!)! {
    let d = readLine()!.split(separator: " ").map { Int(String($0))! }
    cities[d[0]].append((d[1], d[2]))
}

let se = readLine()!.split(separator: " ").map { Int(String($0))! }

var visited = [Bool](repeating: false, count: n+1)
visited[0] = true

var graph = [Int](repeating: Int.max, count: n+1)
graph[se[0]] = 0
visit(se[0])

func visit(_ current: Int) {
    guard current != se[1] else { return }
    
    visited[current] = true
    for (end, value) in cities[current] {
        graph[end] = min(graph[end], graph[current] + value)
    }
    
    let next = graph.enumerated()
        .filter({ !visited[$0.offset] })
        .min(by: { $0.element < $1.element })!.offset
    visit(next)
}

print(graph[se[1]])
