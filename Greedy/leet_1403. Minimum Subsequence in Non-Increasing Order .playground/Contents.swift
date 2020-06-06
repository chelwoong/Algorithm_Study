import Foundation

func minSubsequence(_ nums: [Int]) -> [Int] {
    
    var orderedNums = nums.sorted(by: >)
    var sumOfNums = nums.reduce(0, +)
    
    var results = [Int]()
    var sumOfResults = 0
    
    var index = 0
    while sumOfResults <= sumOfNums {
        guard index < nums.count else { break }
        let n = orderedNums[index]
        results.append(n)
        sumOfNums -= n
        sumOfResults += n
        index += 1
    }
    return results
}

minSubsequence([10, 9])
