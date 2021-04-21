
import Foundation

struct DoubleStackQueue<Element> {
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int{
        return inbox.count + outbox.count
    }
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    init() { }
    
    init(_ array: [Element]) {
        self.init()
        self.inbox = array
    }
    
    mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
}

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

// example
let fIO = FileIO()
let n = fIO.readInt()
let command = [fIO.readInt(), fIO.readInt(), fIO.readInt()]

// t
for _ in 0..<fIO.readInt() {
    let (n, k) = (fIO.readInt(), fIO.readInt())
    
    var runTime = [0]
    for _ in 0..<n {
        runTime.append(fIO.readInt())
    }
    
    var adjacent = [[Int]](repeating: [Int](), count: n+1)
    var adjCount = [Int](repeating: 0, count: n+1)
    adjCount[0] = 1 // 0번은 사용하지 않음
    var totalTime = runTime
    var runSet = Set<Int>(1...n)
    for _ in 0..<k {
        let (s, e) = (fIO.readInt(), fIO.readInt())
        adjacent[s].append(e)
        adjCount[e] += 1
        runSet.remove(e)
    }
    
    let w = fIO.readInt()
    
    var runQueue = DoubleStackQueue(Array(runSet))
    
    while !runQueue.isEmpty {
        let run = runQueue.dequeue()
        guard run != w else { break }
        for adj in adjacent[run] {
            adjCount[adj] -= 1
            if totalTime[adj] < totalTime[run] + runTime[adj] {
                totalTime[adj] = totalTime[run] + runTime[adj]
            }
            if adjCount[adj] == 0 {
                runQueue.enqueue(adj)
            }
        }
    }
    
    print(totalTime[w])
}
