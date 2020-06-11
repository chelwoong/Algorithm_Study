import Foundation

/**
 * Boggle 게임
 * 격자판에서 원하는 글자가 있는지 찾기.
 * - 글자는 상하좌우대각선으로 이어질 수 있다.
 *
 * 시간 복잡도: O(8^N)
 * 모든 칸에 대해 8번의 탐색이 이뤄지고, 최악의 경우 N-1번의 탐색을 한다.
 */

let dx = [-1, 0, 1, -1, 1, -1, 0, 1]
let dy = [-1, -1, -1, 0, 0, 1, 1, 1]

struct Point {
    let x: Int
    let y: Int
    
    func inRange(_ board: [[String]]) -> Bool {
        guard x <= board.count, x >= 0 else { return false }
        guard y <= board.count, y >= 0 else { return false }
        
        return true
    }
}

func hasWord(_ board: [[String]], _ p: Point, _ word: String) -> Bool {
    guard p.inRange(board) else { return false }
    guard board[p.y][p.x] == String(word.first!) else { return false }
    
    if word.count == 1 {
        return true
    }
    
    for i in 0..<8 {
        let nextX = p.x + dx[i]
        let nextY = p.y + dy[i]
        
        if hasWord(board, Point(x: nextX, y: nextY), String(word.dropFirst())) {
            return true
        }
    }
    
    // for문에서 맞으면 true를 리턴해주니까 모두 아닐 경우 false를 return
    return false
}

func boggle(_ board: [[String]], target: String) -> Bool {
    for i in 0..<board.count {
        for j in 0..<board.count {
            //print("x: \(j), y: \(i), \(hasWord(board, Point(x: i, y: j), target))")
            if hasWord(board, Point(x: i, y: j), target) {
                return true
            }
        }
    }
    return false
}

boggle([
    ["U", "R", "L", "P", "M"],
    ["X", "P", "R", "E", "T"],
    ["G", "I", "A", "E", "T"],
    ["X", "T", "N", "Z", "Y"],
    ["X", "O", "Q", "R", "S"]
], target: "GIRL")
