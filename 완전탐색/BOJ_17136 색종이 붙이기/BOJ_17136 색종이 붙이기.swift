
func solution() {
    typealias Point = (r: Int, c: Int)
    var map = [[Int]]()
    
    for _ in 0..<10 {
        map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    func isAttach(_ p: Point, _ size: Int) -> Bool {
        guard p.r + size <= 10, p.c + size <= 10 else { return false }
        
        for r in p.r..<p.r+size {
            for c in p.c..<p.c+size {
                guard map[r][c] == 1 else {
                    return false
                }
                
            }
        }
        return true
    }
    
    func setPaper(_ p: Point, _ size: Int, attaching: Bool) {
        for r in p.r..<p.r+size {
            for c in p.c..<p.c+size {
                map[r][c] = attaching ? 0 : 1
            }
        }
    }
    
    func checkSuccess() {
        for r in 0..<10 {
            for c in 0..<10 {
                guard map[r][c] == 0 else {
                    return
                }
            }
        }
        if minUseCount == -1 || useCount < minUseCount {
            minUseCount = useCount
        }
    }
    
    var minUseCount = -1
    var useCount = 0
    var remainPapers = [Int](repeating: 5, count: 5+1)
    
    func next(_ p: Point) {
        guard minUseCount == -1 || useCount < minUseCount else { return }
        
        if p.c < 9 {
            brutePaper((p.r, p.c+1))
        } else {
            brutePaper((p.r+1, 0))
        }
    }
    
    func brutePaper(_ p: Point) {
        guard p.r < 10, p.c < 10 else {
            checkSuccess()
            return
        }
        
        guard map[p.r][p.c] == 1 else {
            next(p)
            return
        }
        
        for size in (1...5).reversed() {
            if remainPapers[size] > 0, isAttach(p, size) {
                setPaper(p, size, attaching: true)
                remainPapers[size] -= 1
                useCount += 1
                next(p)
                remainPapers[size] += 1
                useCount -= 1
                setPaper(p, size, attaching: false)
            }
        }
    }
    
    brutePaper((0, 0))
    print(minUseCount)
}

solution()
