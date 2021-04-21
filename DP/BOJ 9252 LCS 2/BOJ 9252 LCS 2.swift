

let rowStr = Array(readLine()!)
let colStr = Array(readLine()!)

var lcsTable = [[Int]](repeating: [Int](repeating: 0, count: colStr.count+1), count: rowStr.count+1)


for r in 1..<rowStr.count+1 {
    for c in 1..<colStr.count+1 {
        if colStr[c-1] == rowStr[r-1] {
            lcsTable[r][c] = lcsTable[r-1][c-1]+1
        } else {
            lcsTable[r][c] = max(lcsTable[r][c-1], lcsTable[r-1][c])
        }
    }
}

func backtrackLcs(r: Int, c: Int) -> String {
    if lcsTable[r][c] == 0 {
        return ""
    } else if rowStr[r-1] == colStr[c-1] {
        return backtrackLcs(r: r-1, c: c-1) + String(rowStr[r-1])
    } else if lcsTable[r-1][c] > lcsTable[r][c-1] {
        return backtrackLcs(r: r-1, c: c)
    } else {
        return backtrackLcs(r: r, c: c-1)
    }
}

print(lcsTable[rowStr.count][colStr.count])
if lcsTable[rowStr.count][colStr.count] != 0 {
    print(backtrackLcs(r: rowStr.count, c: colStr.count))
}
