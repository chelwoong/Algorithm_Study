let n = readLine()!.split(separator: " ").map { Int($0)! }
var board = [[Int]]()
for _ in 0..<n[0] {
  var row = [Int]()
  for c in readLine()! {
    row.append(Int(String(c))!)
  }
  board.append(row)
}

// bfs

struct Point {
  var row: Int
  var col: Int
}

func isInRange(point: Point, in board: [[Int]]) -> Bool {
  return point.row >= 0 &&
        point.col >= 0 &&
        point.row < board.count &&
        point.col < board[point.row].count
}

func canVisited(point: Point, in board: [[Int]]) -> Bool {
  return board[point.row][point.col] == 1
}

// 상 하 좌 우
var dr = [-1, 1, 0, 0]
var dc = [0, 0, -1, 1]

func bfs(board: inout [[Int]], start: Point) -> Int {
  var q = [Point]()
  q.append(start)
  while !q.isEmpty {
    let point = q.removeFirst()
    if point.row == board.count, point.col == board[0].count {
      break
    }

    for i in 0..<dr.count {
      let nextRow = point.row + dr[i]
      let nextCol = point.col + dc[i]
      let nextPoint = Point(row: nextRow, col: nextCol)
      if isInRange(point: nextPoint, in: board), canVisited(point: nextPoint, in: board) {
        board[nextRow][nextCol] = board[point.row][point.col]+1
        q.append(nextPoint)
      }
    }
  }

  return board[board.count-1][board[0].count-1]
