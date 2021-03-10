
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

let mnh = readLine()!.split(separator: " ").map { Int(String($0))! }

var tomato = [[[Int]]](repeating: [[Int]](), count: mnh[2])

for h in 0..<mnh[2] {
    for _ in 0..<mnh[1] {
        tomato[h].append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
}

typealias Point = (h: Int, r: Int, c: Int)
var queue = DoubleStackQueue<Point>()

for h in 0..<mnh[2] {
    for r in 0..<mnh[1] {
        for c in 0..<mnh[0] {
            if tomato[h][r][c] == 1 {
                queue.enqueue(Point(h, r, c))
            }
        }
    }
}

func infects(_ p: Point) -> [Point] {
    return [
        Point(p.h-1, p.r, p.c),
        Point(p.h+1, p.r, p.c),
        Point(p.h, p.r-1, p.c),
        Point(p.h, p.r+1, p.c),
        Point(p.h, p.r, p.c-1),
        Point(p.h, p.r, p.c+1),
    ]
}

func isInRange(_ p: Point) -> Bool {
    return 0..<mnh[2] ~= p.h &&
        0..<mnh[1] ~= p.r &&
        0..<mnh[0] ~= p.c
}

var longestTime = 0
while !queue.isEmpty {
    let curr = queue.dequeue()

    for next in infects(curr) where isInRange(next) {
        if tomato[next.h][next.r][next.c] == 0 {
            tomato[next.h][next.r][next.c] = tomato[curr.h][curr.r][curr.c] + 1
            queue.enqueue(next)
            if tomato[next.h][next.r][next.c]-1 > longestTime {
                longestTime = tomato[next.h][next.r][next.c]-1
            }
        }
    }
}

var success = true
for h in 0..<mnh[2] {
    for r in 0..<mnh[1] {
        for c in 0..<mnh[0] {
            if tomato[h][r][c] == 0 {
                success = false
            }
        }
    }
}

print(success ? longestTime : -1)
