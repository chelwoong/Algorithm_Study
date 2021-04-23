
func solution(_ n:Int) -> Int {
    
    if n < 3 {
        return n
    }
    
    var dp = [Int](repeating: 0, count: 2000)
    dp[0] = 1
    dp[1] = 2
    
    for i in 2..<n {
        dp[i] = (dp[i-1] % 1234567) + (dp[i-2] % 1234567)
    }
    
    return dp[n-1] % 1234567
}

print(solution(2000))
print(solution(1))
print(solution(4))
print(solution(3))
