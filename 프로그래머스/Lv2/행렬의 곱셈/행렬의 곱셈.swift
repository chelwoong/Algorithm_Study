import Foundation

func multipleSquare(square1: [[Int]], square2: [[Int]]) -> [[Int]] {
    var square = [[Int]](repeating: [Int](repeating: 0, count: square2[0].count), count: square1.count)
    
    for row in 0..<square.count {
        for col in 0..<square[0].count {
            var result = 0
            for (rIdx, r) in square1[row].enumerated() {
                result += r * square2[rIdx][col]
            }
            square[row][col] = result
        }
    }
    
    return square
}

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return multipleSquare(square1: arr1, square2: arr2)
}
