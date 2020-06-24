let n = Int(readLine()!)!
var minCounts = [Int](repeating: Int.max, count: n+1)
minCounts[1] = 0

func makeMinCounts(to number: Int) {
  guard number > 1 else { return }
  for current in 2...number {
    if current % 3 == 0 {
      minCounts[current] = min(minCounts[current/3]+1, minCounts[current])
    }
    if current % 2 == 0 {
      minCounts[current] = min(minCounts[current/2]+1, minCounts[current])
    }
    minCounts[current] = min(minCounts[current-1]+1, minCounts[current])
  }
}
makeMinCounts(to: n)

print(minCounts[n])

//let n = Int(readLine()!)!
//var dp = [Int?](repeating: nil, count: 1000001)
//dp[1] = 0
//dp[2] = 1
//
//func findCountMakeOne(number: Int) -> Int {
//  if let dpCount = dp[number] {
//    return dpCount
//  } else {
//    var minCount = Int.max
//    if number % 3 == 0 {
//      minCount = min(findCountMakeOne(number: number / 3), minCount)
//    }
//    if number % 2 == 0 {
//      minCount = min(findCountMakeOne(number: number / 2), minCount)
//    }
//    minCount = min(findCountMakeOne(number: number-1), minCount)
//    dp[number] = minCount+1
//    return minCount+1
//  }
//}
//
//print(findCountMakeOne(number: n))


