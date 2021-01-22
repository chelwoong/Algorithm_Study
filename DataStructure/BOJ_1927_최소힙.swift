import Foundation

struct Heap<T: Comparable> {
    var nodes = [T]()
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(from: nodes.count-1)
    }
    
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        nodes.swapAt(0, nodes.count-1)
        let min = nodes.removeLast()
        shiftDown(from: 0)
        return min
    }
    
    mutating func shiftDown(from start: Int) {
        let left = start * 2 + 1
        let right = start * 2 + 2
        
        var next = start
        if left < nodes.count, nodes[left] < nodes[next] {
            next = left
        }
        if right < nodes.count, nodes[right] < nodes[next] {
            next = right
        }
        
        guard next != start else { return }
        nodes.swapAt(next, start)
        shiftDown(from: next)
    }
    
    mutating func shiftUp(from start: Int) {
        var child = start
        var parent = (start-1) / 2
        
        while parent >= 0, nodes[parent] > nodes[child] {
            nodes.swapAt(child, parent)
            child = parent
            parent = (child-1) / 2
        }
    }
}

let n = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 0..<n {
    let x = Int(readLine()!)!
    guard x != 0 else {
        print(heap.remove() ?? 0)
        continue
    }

    heap.insert(x)
}
