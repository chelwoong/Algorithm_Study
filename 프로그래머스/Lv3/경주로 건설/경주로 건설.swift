import Foundation

enum Direction: Int {
    case horizontal = 0, vertical
}

func solution(_ board:[[Int]]) -> Int {
    let size = board.count
    typealias Point = (r: Int, c: Int, cost: Int, dir: Direction)
    
    let dr = [-1, 1, 0, 0]
    let dc = [0, 0, 1, -1]

    var price = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 2000000, count: 2), count: board.count), count: board.count)
    price[0][0] = [0, 0]
    var queue = [Point]()
    if board[0][1] == 0 {
        price[0][1][0] = 100
        queue.append(Point(0,1,100,.horizontal))
    }
    if board[1][0] == 0 {
        price[1][0][1] = 100
        queue.append(Point(1,0,100,.vertical))
    }

    while !queue.isEmpty {
        let (r, c, cost, dir) = queue.removeFirst()
        
        for d in 0..<4 where 0..<size ~= r + dr[d] && 0..<size ~= c + dc[d] {
            let dr = r + dr[d]
            let dc = c + dc[d]
            
            guard board[dr][dc] == 0 else { continue }
            
            var next = Point(dr, dc, cost+100, dir)
            
            if d < 2, dir == .horizontal {
                next.cost += 500
                next.dir = .vertical
            } else if d >= 2, dir == .vertical {
                next.cost += 500
                next.dir = .horizontal
            }
            
            if price[dr][dc][next.dir.rawValue] > next.cost {
                price[dr][dc][next.dir.rawValue] = next.cost
                queue.append(next)
            }
        }
    }
    
    return price[size-1][size-1].min()!
}
