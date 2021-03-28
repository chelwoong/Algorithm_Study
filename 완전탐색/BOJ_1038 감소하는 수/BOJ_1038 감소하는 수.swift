let n = Int(readLine()!)!

func solution() {
    guard n >= 10 else { print(n); return }
    guard n < 1023 else { print(-1); return }
    
    var decreases = (0...9).map { $0 }
    var target = 0
    
    while true {
        let before = decreases[target] % 10
        for num in 0..<before {
            decreases.append(decreases[target] * 10 + num)
            
            if n+1 == decreases.count {
                print(decreases[n])
                return
            }
        }
        target += 1
    }
}

solution()
