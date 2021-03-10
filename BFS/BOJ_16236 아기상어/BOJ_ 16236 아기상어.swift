
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

extension DoubleStackQueue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        inbox = elements
    }
}

let n = Int(readLine()!)!
var map = [[Int]]()
typealias Point = (r: Int, c: Int)
var start: Point!

for r in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    if let baby = map[r].enumerated().filter({ $0.element == 9 }).first {
        start = (r, baby.offset)
        map[r][baby.offset] = 0
    }
}

func nexts(_ p: Point) -> [Point] {
    return [
        Point(p.r-1, p.c),
        Point(p.r, p.c-1),
        Point(p.r, p.c+1),
        Point(p.r+1, p.c),
    ]
}

func isInRange(_ p: Point) -> Bool {
    return 0..<n ~= p.r && 0..<n ~= p.c
}

func nearbyFeed(_ start: Point) -> (Int, Point)? {
    var dist = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    dist[start.r][start.c] = 0
    var q = DoubleStackQueue<Point>()
    q.enqueue(start)
    var nearst = -1
    var feeds = [Point]()
    
    while !q.isEmpty {
        let curr = q.dequeue()
        for next in nexts(curr) where isInRange(next) && next != start {
            if dist[next.r][next.c] == 0, map[next.r][next.c] <= shark {
                q.enqueue(next)
                dist[next.r][next.c] = dist[curr.r][curr.c] + 1
                if map[next.r][next.c] != 0, map[next.r][next.c] < shark {
                    if dist[next.r][next.c] < nearst || nearst == -1 {
                        nearst = dist[next.r][next.c]
                        feeds = [next]
                    } else if nearst == dist[next.r][next.c] {
                        feeds.append(next)
                    }
                }
            }
        }
    }
    
    let nearstPoint = feeds.sorted(by: { $0.r == $1.r ? $0.c < $1.c : $0.r < $1.r}).first
    return (nearstPoint == nil || nearst == -1) ? nil : (nearst, nearstPoint!)
}

var shark = 2
var feeds = 0
var moving = 0

while let (dist, next) = nearbyFeed(start) {
    start = next
    moving += dist
    map[next.r][next.c] = 0
    feeds += 1
    if shark == feeds {
        feeds = 0
        shark += 1
    }
}

print(moving)
