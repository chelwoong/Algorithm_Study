let str1 = Array(readLine()!)
let str2 = Array(readLine()!)
let str3 = Array(readLine()!)

func lcs(_ strA: [Character], _ strB: [Character], strC: [Character]) {
    
    var table = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: strC.count+1), count: strB.count+1), count: strA.count+1)
    
    for a in 1...strA.count {
        for b in 1...strB.count {
            for c in 1...strC.count {
                if strA[a-1] == strB[b-1], strA[a-1] == strC[c-1] {
                    table[a][b][c] = table[a-1][b-1][c-1]+1
                } else {
                    table[a][b][c] = max(table[a-1][b][c], table[a][b-1][c], table[a][b][c-1])
                }
            }
        }
    }
    
    var a = strA.count
    var b = strB.count
    var c = strC.count
    
    print(table[a][b][c])

//    var result = ""
//    while table[a][b][c] > 0 {
//        if table[a-1][b][c] == table[a][b-1][c], table[a-1][b][c] == table[a][b][c-1] {
//            a -= 1; b -= 1; c -= 1
//            result.append(strA[a])
//        } else if table[a-1][b][c] > table[a][b-1][c], table[a-1][b][c] > table[a][b][c-1] {
//            a -= 1
//        } else if table[a][b-1][c] > table[a-1][b][c], table[a][b-1][c] > table[a][b][c-1] {
//            b -= 1
//        } else {
//            c -= 1
//        }
//    }
//    print(String(result.reversed()))
}

lcs(str1, str2, strC: str3)
