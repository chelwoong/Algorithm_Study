import Foundation

func solution(_ land:[[Int]]) -> Int{
    var scoreTable = land[0]
    for row in 1..<land.count {
        var beforeScore = scoreTable
        for col in 0..<4 {
            var currentLand = land[row][col]
            for tableCol in 0..<4 {
                guard tableCol != col else { continue }
                scoreTable[col] = max(
                    scoreTable[col],
                    beforeScore[tableCol] + currentLand
                )
            }
        }
    }

    return scoreTable.max()!
}
