let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
var metrix = [[Int]]()
var rcsList = [[Int]]()
var minResult = 50 * 50 * 101

for _ in 0..<nmk[0] {
    metrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for _ in 0..<nmk[2] {
    rcsList.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func rotate(_ rcs: [Int], metrix: inout [[Int]]) {
    let row = rcs[0]-1
    let col = rcs[1]-1
    
    let origin = metrix
    
    for s in 1...rcs[2] {
        // 위
        for c in col-s..<col+s {
            metrix[row-s][c+1] = origin[row-s][c]
        }
        
        // 아래
        for c in (col-s+1...col+s).reversed() {
            metrix[row+s][c-1] = origin[row+s][c]
        }
        
        // 오른쪽
        for r in row-s..<row+s {
            metrix[r+1][col+s] = origin[r][col+s]
        }
        
        // 왼쪽
        for r in (row-s+1...row+s).reversed() {
            metrix[r-1][col-s] = origin[r][col-s]
        }
    }
}

func checkArray() {
    var copy = metrix
    for rcs in rcsList {
        rotate(rcs, metrix: &copy)
    }
    
    let arrayValue = copy.map({ $0.reduce(0, +) }).min()!
    
    if arrayValue < minResult {
        minResult = arrayValue
    }
}

func selectRcs(_ idx: Int) {
    guard idx < rcsList.count else {
        checkArray()
        return
    }
    
    for i in idx..<rcsList.count {
        rcsList.swapAt(i, idx)
        selectRcs(idx+1)
        rcsList.swapAt(i, idx)
    }
}


selectRcs(0)
print(minResult)
