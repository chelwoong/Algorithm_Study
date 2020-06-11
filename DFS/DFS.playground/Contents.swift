import UIKit

class Node: Equatable {
    var data: Int
    var visit: Bool
    var adjacent: [Node]
    
    init(data: Int) {
        self.data = data
        visit = false
        adjacent = []
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data
    }
}

class Graph {
    var nodes: [Node]
    
    init(size: Int) {
        self.nodes = [Node]()
        for i in 0..<size {
            let node = Node(data: i)
            self.nodes.append(node)
        }
    }
    
    func addEdge(_ n1: Int, _ n2: Int) {
        if !self.nodes[n1].adjacent.contains(self.nodes[n2]) {
            self.nodes[n1].adjacent.append(nodes[n2])
        }
        if !self.nodes[n2].adjacent.contains(self.nodes[n1]) {
            self.nodes[n2].adjacent.append(nodes[n1])
        }
    }
}

/*
      0
     /
    1 ㅡㅡ 3
    |     | \
    2 ㅡㅡ 4  5
              \
               6 ㅡ 7
 */

func dfs(_ node: Node) -> [Int] {
    node.visit = true
    var nodesExplored = [node.data]
    
    for n in node.adjacent {
        guard !n.visit else { continue }
        n.visit = true
        nodesExplored.append(contentsOf: dfs(n))
    }
    
    return nodesExplored
}

var graph = Graph(size: 8)

func main() {
    graph.addEdge(0, 1)
    graph.addEdge(1, 2)
    graph.addEdge(1, 3)
    graph.addEdge(2, 4)
    graph.addEdge(3, 5)
    graph.addEdge(5, 6)
    graph.addEdge(6, 7)
    
    dfs(graph.nodes[0])
}

main()
