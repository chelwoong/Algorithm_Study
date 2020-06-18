// MARK: - 1700 멀티탭 스케쥴링

/*
input
2 7
2 3 2 3 1 2 7

output
2

test case
2 17
2 1 3 1 3 1 3 1 3 2 2 2 2 2 2 2 2
--> 2

 */


let n = readLine()!.split(separator: " ").map{Int($0)!}
let usageList = readLine()!.split(separator: " ").map{Int($0)!}

var plug = [Int]()
var offCount = 0

for (i, e) in usageList.enumerated() {
  if plug.contains(e) {
    continue
  } else if plug.count < n[0] {
    plug.append(e)
  } else {
    /// 이제 뺄 아이를 정해야 한다.
    // 가장 나중에 사용될 아이를 찾는다.
    // 사용되지 않았다면(그대로 -1) 바로 빼버린다.
    var offIndex = -1
    var lastUsed = -1
    for (plugIndex, p) in plug.enumerated() {
      var shouldUsed = -1
      
      for plugUsedIndex in i+1..<usageList.count {
        if p == usageList[plugUsedIndex] {
          shouldUsed = plugUsedIndex
          break
        }
      }
      
      // 앞으로 사용되지 않는다면 얘를 빼버린다.
      if shouldUsed == -1 {
        offIndex = plugIndex
        break
      } else {
        if shouldUsed > lastUsed {
          lastUsed = shouldUsed
          offIndex = plugIndex
        }
      }
    }
    
    plug[offIndex] = e
    offCount += 1
  }
}

print(offCount)
