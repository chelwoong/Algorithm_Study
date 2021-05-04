import Foundation

typealias Point = (r: Int, c: Int, move: Int)
var playBoard = [[Int]]()
let inf = 9_999_999_999

func bfs(_ cursor: Point, _ card: Point) -> Int {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: 4), count: 4)
    visit[cursor.r][cursor.c] = true
    var q = [Point]()
    q.append(cursor)
    
    let delta = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    
    while !q.isEmpty {
        let (r, c, move) = q.removeFirst()
        if card.r == r, card.c == c {
            return move
        }
        
        for d in delta {
            var nr = r + d[0], nc = c + d[1]
            if nr < 0 || nr > 3 || nc < 0 || nc > 3 {
                continue
            }
            
            if !visit[nr][nc] {
                q.append(Point(nr, nc, move+1))
                visit[nr][nc] = true
            }
            
            for _ in 0..<2 {
                guard playBoard[nr][nc] == 0, nr + d[0] >= 0, nr + d[0] < 4, nc + d[1] >= 0, nc + d[1] < 4 else { break }
                nr += d[0]
                nc += d[1]
            }
            
            if !visit[nr][nc] {
                q.append(Point(nr, nc, move+1))
                visit[nr][nc] = true
            }
        }
    }
    return -1
}

func permutate(_ cursor: Point) -> Int {
    var result = inf
    for card in 1...6 {
        var cards = [Point]()
        for r in 0..<4 {
            for c in 0..<4 {
                guard playBoard[r][c] == card else { continue }
                cards.append(Point(r, c, 0))
            }
        }
        
        guard !cards.isEmpty else { continue }
        
        let try1 = bfs(cursor, cards[0]) + bfs(cards[0], cards[1]) + 2
        let try2 = bfs(cursor, cards[1]) + bfs(cards[1], cards[0]) + 2
        
        cards.forEach {
            playBoard[$0.r][$0.c] = 0
        }
        
        result = min(result, try1 + permutate(cards[1]))
        result = min(result, try2 + permutate(cards[0]))
        
        cards.forEach {
            playBoard[$0.r][$0.c] = card
        }
    }
    
    if result == inf {
        return 0
    }
    
    return result
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    playBoard = board
    return permutate(Point(r, c, 0))
}
