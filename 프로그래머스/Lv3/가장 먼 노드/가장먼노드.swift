import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var nodes = [[Int]](repeating: [Int](), count: n+1)
    for e in edge {
        nodes[e[0]].append(e[1])
        nodes[e[1]].append(e[0])
    }

    var distances = [Int](repeating: 0, count: n+1)

    var q = [Int]()
    q.append(1)
    
    while !q.isEmpty {
        let currentNode = q[0]
        q.removeFirst()
        
        for node in nodes[currentNode] {
            guard distances[node] == 0, node != 1 else { continue }
            distances[node] = distances[currentNode]+1
            q.append(node)
        }
    }
    let max = distances.max()!
    return distances.filter{ $0 == max }.count
}


