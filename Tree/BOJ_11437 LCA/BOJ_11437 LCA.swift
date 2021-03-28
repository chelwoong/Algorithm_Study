// 11437 LCA

let n = Int(readLine()!)!
var edgeData = [[Int]](repeating: [Int](), count: n+1)

for _ in 0..<n-1 {
  let ed = readLine()!.split(separator: " ").map { Int(String($0))! }
  edgeData[ed[0]].append(ed[1])
  edgeData[ed[1]].append(ed[0])
}

typealias NodeData = (parents: Int, depth: Int)
var parents = [Int](repeating: 0, count: n+1)
var depth = [Int](repeating: 0, count: n+1)
var connection = [Bool](repeating: false, count: n+1)
connection[1] = true

func connectSubs(_ p: Int) {
  edgeData[p].forEach { node in
    guard !connection[node] else { return }
    parents[node] = p
    depth[node] = depth[p] + 1
    connection[node] = true
    connectSubs(node)
  }
}

connectSubs(1)

let m = Int(readLine()!)!
for _ in 0..<m {
  let search = readLine()!.split(separator: " ").map { Int(String($0))! }
  var t1 = search[0]
  var t2 = search[1]

  guard t1 != t2 else { print(t1); continue }

  while true {
    if depth[t1] == depth[t2] {
      guard t1 != t2 else { print(t1); break }
      while parents[t1] != parents[t2] {
        t1 = parents[t1]
        t2 = parents[t2]
      }
      print(parents[t1])
      break
    } else if depth[t1] < depth[t2] {
      t2 = parents[t2]
    } else {
      t1 = parents[t1]
    }
  }
}
