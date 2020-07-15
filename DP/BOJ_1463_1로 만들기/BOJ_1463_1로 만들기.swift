
// top down
var dp = [Int:Int]()
dp[1] = 0
dp[2] = 1
dp[3] = 1

let n = Int(readLine()!)!

func makeOne(num: Int) -> Int {
    if let before = dp[num] {
        return before
    }
    
    var minimum = Int.max
    if num % 3 == 0 {
        minimum = min(makeOne(num: num/3)+1, minimum)
    }
    if num % 2 == 0 {
        minimum = min(makeOne(num: num/2)+1, minimum)
    }
    minimum = min(makeOne(num: num-1)+1, minimum)

    dp[num] = minimum
    return minimum
}

print(makeOne(num: n))


// Bottom up
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
