import UIKit

func maxSubArray(_ nums: [Int]) -> Int {
    
    var currentSum = 0
    var maxSum = Int.min
    
    for n in nums {
        currentSum += n
        maxSum = max(maxSum, currentSum)
        currentSum = max(currentSum, 0)
    }
    
    return maxSum
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
