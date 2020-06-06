
//while let row = readLine()?.split(separator: " ").map({Int($0)!}) {
//    diamond.append(row)
//    sumDia.append([Int](repeating: 0, count: row.count))
//}

//4
//3
//4 1
//7 9 2
//2 7 9 6
//1 9 5
//7 3
//9

//let centerN = 4
//let diamond = [[3], [4, 1], [7,9,2], [2,7,9,6], [1,9,5], [7,3], [9]]
//var sumDia = [[Int]](repeating: [], count: diamond.count)
//for (i, d) in diamond.enumerated() {
//    sumDia[i] = [Int](repeating: 0, count: d.count)
//}
//print(sumDia)

let centerN = Int(readLine()!)!
var diamond = [[Int]](repeating: [], count: centerN + centerN-1)
var sumDia = [[Int]](repeating: [], count: centerN + centerN-1)

for i in 0..<diamond.count {
    let row = readLine()!.split(separator: " ").map({Int($0)!})
    diamond[i].append(contentsOf: row)
    sumDia[i].append(contentsOf: [Int](repeating: 0, count: row.count))
}

for row in 0..<diamond.count {
    for col in 0..<diamond[row].count {
        if row < centerN {
            // 다이아 위부분
            // 처음와 끝을 신경써야함
            if col == 0 {
                if row-1 >= 0 {
                    sumDia[row][col] += sumDia[row-1][col]
                }
                sumDia[row][col] += diamond[row][col]
            } else if col == diamond[row].count-1 {
                if row-1 >= 0 {
                    sumDia[row][col] = diamond[row][col] + sumDia[row-1][col-1]
                }
            } else {
                let curr = diamond[row][col]
                let sum1 = curr + sumDia[row-1][col-1]
                let sum2 = curr + sumDia[row-1][col]
                sumDia[row][col] = max(sum1, sum2)
            }
        } else {
            // 다이아 아래부분
            // 모두 동일
            let curr = diamond[row][col]
            let sum1 = curr + sumDia[row-1][col]
            let sum2 = curr + sumDia[row-1][col+1]
            sumDia[row][col] = max(sum1, sum2)
        }
    }
}

print(sumDia[sumDia.count-1][0])
