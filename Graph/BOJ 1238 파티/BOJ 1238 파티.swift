import Foundation

typealias Edge = (dest: Int, dist: Int)

let nmx = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, x) = (nmx[0], nmx[1], nmx[2])
var map = [[Edge]](repeating: [Edge](), count: n+1)

for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, e, t) = (data[0], data[1], data[2])
    map[s].append(Edge(e, t))
}

func search(_ start: Int, _ end: Int) -> Int {
    var dist = [Int](repeating: Int.max, count: n+1)
    var visit = [Bool](repeating: false, count: n+1)
    dist[start] = 0
    
    var pq = PriorityQueue<(node: Int, dist: Int)>(ordered: { $0.dist > $1.dist })
    pq.push((start, 0))
    
    while let (curr, distance) = pq.pop() {
        guard curr != end else { return distance }
        guard dist[curr] >= distance, !visit[curr] else { continue }
        visit[curr] = true
        
        for (edge, d) in map[curr] where !visit[edge] {
            let nextDist = distance + d
            if nextDist < dist[edge] {
                dist[edge] = nextDist
                pq.push((edge, nextDist))
            }
        }
    }
    
    return dist[end]
}

var maxCost = 0
for s in 1...n where s != x {
    let cost = search(s, x) + search(x, s)
    if cost > maxCost {
        maxCost = cost
    }
}
print(maxCost)

// MARK: - Helpers

struct PriorityQueue<T> {
    internal var heap = Array<T>()
    public let ordered: (T, T) -> Bool
    
    public init(ordered: @escaping (T, T) -> Bool) {
        self.ordered = ordered
    }
    
    var count: Int {
        return heap.count
    }
    
    var top: T? {
        return heap.first
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    public mutating func pop() -> T? {
        guard heap.count > 1 else {
            return heap.popLast()
        }
        heap.swapAt(0, heap.count - 1)
        let last = heap.removeLast()
        sink(0)
        
        return last
    }
    
    public mutating func sink(_ index: Int) { //힙의 재구성
        var index = index
        
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1 //왼쪽 자식 노드
            if j + 1 < heap.count && ordered(heap[j], heap[j+1]) { j += 1 }
            if !ordered(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }
    
    public mutating func swim(_ index: Int) { //힙의 구성
        var index = index
        
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}
