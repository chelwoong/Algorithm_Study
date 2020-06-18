let n = readLine()!.split(separator: " ").map{Int($0)!}
var map = [[Bool]]()

for _ in 0..<n[0] {
  // "." 이면 true, "X" 이면 false
  map.append(readLine()!.map {$0 == "."})
}

func inRange(_ r: Int, _ c: Int) -> Bool {
  return r >= 0 && c >= 0 && r < n[0] && c < n[1]
}
var dr = [-1, 0, 1]
var result = 0

func dfs(_ r: Int, _ c: Int) -> Bool {
  
  
  if c == n[1]-1 {
    return true
  }
  
  for i in 0..<3 {
    let row = r + dr[i]
    let col = c + 1
    if inRange(row, col), map[row][col] {
      map[row][col] = false
      // return dfs(row, col)처럼 그냥 리턴시켜버리면 안된다.
      // 결과가 true일 경우에만 true를 리턴해야한다.
      // 아니면 다음 경우를 해보기 위해 통과시켜야 함
      if dfs(row, col) {
        return true
      }
    }
  }
  return false
}

for i in 0..<n[0] {
  if dfs(i, 0) { result += 1 }
}
//map.forEach{print($0)}
print(result)
