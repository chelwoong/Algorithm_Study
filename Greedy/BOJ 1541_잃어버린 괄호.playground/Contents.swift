
/**
 * https://www.acmicpc.net/problem/1541
 * 그리디
 * 적절히 괄호를 쳐서 최소인 수를 만들어라
 * 시간제한 2초 / 메모리 128MB
 */

import Foundation

var str = readLine()!
var plusOpers = str.components(separatedBy: "-")
var minusNumbers = [Int]()

for opr in plusOpers {
    let numbers = opr.components(separatedBy: "+").map({Int($0)!})
    minusNumbers.append(numbers.reduce(0, +))
}

var result = minusNumbers[0]
for i in 1..<minusNumbers.count {
    result -= minusNumbers[i]
}

print(result)
