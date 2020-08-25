var caseCount = 0
while let input = readLine() {
    guard input != "0 0 0" else { break }
    
    caseCount += 1
    let lpv = input.split(separator: " ").map { Int($0)! }
    let l = lpv[0]
    let p = lpv[1]
    let v = lpv[2]
    
    let maxSplitDay = v / p
    let rest = min(v % p, l)
    
    
    print("Case \(caseCount): \(maxSplitDay * l + rest)")
}
