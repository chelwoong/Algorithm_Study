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

typealias Point = (r: Int, c: Int)
let nmp = readLine()!.split(separator: " ").map { Int(String($0))! }
var playerMoving = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var map = [[Int]](repeating: [Int](repeating: -1, count: nmp[1]), count: nmp[0])
var playerCount = [Int](repeating: 0, count: playerMoving.count)
var queue = [[Point]](repeating: [Point](), count: playerMoving.count)

for r in 0..<nmp[0] {
    for (c, value) in readLine()!.enumerated() {
        if value == "." {
            map[r][c] = 0
        } else if let p = Int(String(value)) {
            map[r][c] = p
            queue[p].append((r, c))
            playerCount[p] += 1
        }
    }
}

let dr = [-1, 1, 0, 0]
let dc = [0, 0, -1, 1]

while queue.filter({ $0.isEmpty }).count != queue.count {
    // 턴
    for player in 1..<playerMoving.count {
        var nextTurn = [Point]()
        var thisTurn = DoubleStackQueue<(Point, Int)>(queue[player].map { ($0, 0) })

        while !thisTurn.isEmpty {
            let (curr, moving) = thisTurn.dequeue()
            
            for d in 0..<4 where 0..<nmp[0] ~= curr.r + dr[d] && 0..<nmp[1] ~= curr.c + dc[d] {
                let next = Point(curr.r + dr[d], curr.c + dc[d])
                guard map[next.r][next.c] == 0 else { continue }
                playerCount[player] += 1
                map[next.r][next.c] = player
                if moving+1 < playerMoving[player] {
                    thisTurn.enqueue((next, moving+1))
                } else if moving+1 == playerMoving[player] {
                    nextTurn.append(next)
                }
            }
        }
        queue[player] = nextTurn
    }
}

print(playerCount.dropFirst().map({ String($0) }).joined(separator: " "))
