import Foundation

extension Int {
    var isPrime: Bool {
        guard self != 1 else { return false }
        guard self != 2, self != 3 else { return true }
        for i in 2...Int(sqrt(Double(self))) {
            if self%i == 0 {
                return false
            }
        }
        return true
    }
}

func solution(_ nums:[Int]) -> Int {
    var primes = Set<[Int]>()
    
    for first in 0..<nums.count-2 {
        for second in first+1..<nums.count-1 {
            if first == second { continue }
            for third in second+1..<nums.count {
                if third == first || third == second {
                    continue
                }
                if (nums[first] + nums[second] + nums[third]).isPrime {
                    primes.insert([first, second, third])
                }
            }
        }
    }
    print(primes)
    return primes.count
}
