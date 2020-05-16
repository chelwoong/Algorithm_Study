import UIKit


struct Point {
    var x, y
}

var coverType: [[[Int]]] = [
    [[0, 0], [0, 1], [1, 1]],
    [[0, 0], [1, 0], [1, 1]],
    [[0, 0], [0, 1], [-1, 1]],
    [[0, 0], [1, 0], [0, 1]]
]

func coverBoard(_ p: Point, _ type: [[Int]], _ board: [[Int]]) -> Bool {
    
}

func boardCover(_ h: Int, _ w: Int, _ board: [String]) -> Int {
    var myBoard = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
    
    for c in h {
        for r in w {
            if board[r][c] == "#" {
                myBoard[r][c] = -1
            }
        }
    }
    
    print(myBoard)
    
    return 0
}

boardCover(3, 7, [
    "#.....#",
    "#.....#",
    "##...##"
])
