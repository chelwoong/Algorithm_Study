typealias Point = (r: Int, c: Int)

let n = Int(readLine()!)!
var map = [[Int]]()

var maxValue = 0
var minValue = 200
for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
  maxValue = max(maxValue, map.last!.max()!)
  minValue = min(minValue, map.last!.min()!)
}

var minDiff = 201
var dr = [-1, 1, 0, 0]
var dc = [0, 0, 1, -1]

func search(_ minDiff: Int) -> Bool {
  
  for min in minValue...maxValue {
    
    guard min...min+minDiff ~= map[0][0] else { continue }
    
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    visit[0][0] = true
    
    var q = [Point(0, 0)]
    while !q.isEmpty {
      let curr = q.removeFirst()
      
      for d in 0..<4 where 0..<n ~= curr.r + dr[d] && 0..<n ~= curr.c + dc[d] {
        let next = Point(curr.r + dr[d], curr.c + dc[d])
        guard !visit[next.r][next.c], min...min+minDiff ~= map[next.r][next.c] else { continue }
        if next.r == n-1, next.c == n-1 {
          return true
        }
        visit[next.r][next.c] = true
        q.append(next)
      }
    }
  }
  
  return false
}

var low = 0
var high = maxValue

while(low <= high) {
  let mid = (low + high)/2
  if search(mid) {
    minDiff = min(minDiff, mid)
    high = mid-1
  } else {
    low = mid+1
  }
}

print(minDiff)
