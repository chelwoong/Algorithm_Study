import Foundation

protocol Readable {
    func readSingleValue() -> String
    func readArray(with separator: Character) -> [String]
}

extension Readable {
    func readSingleValue() -> String {
        return readLine()!
    }
    
    func readSingleValue() -> Int {
        return Int(readLine()!)!
    }
    
    func readArray(with separator: Character) -> [String] {
        return readLine()!.split(separator: " ").map { String($0) }
    }
    
    func readArray(with separator: Character) -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }
}

class BOJ1967: Readable {
    
    class Node {
        var value: Int
        var weight: Int
        
        init(_ value: Int, weight: Int) {
            self.value = value
            self.weight = weight
        }
    }
    
    func input() {
        for _ in 0..<readSingleValue()-1 {
            let n: [Int] = readArray(with: " ")
            nodes[n[0]].append(Node(n[1], weight: n[2]))
            nodes[n[1]].append(Node(n[0], weight: n[2]))
        }
    }
    
    var nodes = [[Node]](repeating: [Node](), count: 10001)
    var visited = [Bool](repeating: false, count: 10001)
    var maxDiameter = 0
    var farthestNodeFromRoot = 0
    
    func solution() {
        input()
        dfs(node: 1, weight: 0)
        visited = [Bool](repeating: false, count: 10001)
        dfs(node: farthestNodeFromRoot, weight: 0)
        print(maxDiameter)
    }
    
    func dfs(node: Int, weight: Int) {
        guard !visited[node] else { return }
        visited[node] = true
        
        if weight > maxDiameter {
            maxDiameter = weight
            farthestNodeFromRoot = node
        }
        
        for adj in nodes[node] {
            dfs(node: adj.value, weight: weight + adj.weight)
        }
    }
}

BOJ1967().solution()
