
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

class BOJ2252_줄세우기: Readable {
    
    func input() {
        let data: [Int] = readArray(with: " ")
        n = data[0]
        entrie = [Int](repeating: 0, count: n+1)
        degrees = [[Int]](repeating: [Int](), count: n+1)
        for _ in 0..<data[1] {
            let nodes: [Int] = readArray(with: " ")
            degrees[nodes[0]].append(nodes[1])
            entrie[nodes[1]] += 1
        }
    }
    
    // MARK: Properties
    
    var n: Int!
    var degrees: [[Int]]!
    var entrie: [Int]!
    
    // MARK: Solution
    
    func solution() {
        input()
        var zeroQueue = [Int]()
        var queuePointer = 0
        var ordered = [Int]()
        
        for (zeroEntry, enter) in entrie.enumerated() where enter == 0 && zeroEntry != 0 {
            zeroQueue.append(zeroEntry)
        }
        
        while queuePointer < zeroQueue.count {
            let node = zeroQueue[queuePointer]
            queuePointer += 1
            ordered.append(node)
            degrees[node].forEach { degree in
                entrie[degree] -= 1
                if entrie[degree] == 0 {
                    zeroQueue.append(degree)
                }
            }
        }
        
        print(ordered.reduce(into: "", { $0 += "\($1) "}).dropLast())
    }
}

BOJ2252_줄세우기().solution()
