import Foundation

struct Pair: Hashable {
    var s: Int
    var e: Int
    
    static func ==(lhs: Pair, rhs: Pair) -> Bool {
        return lhs.s == rhs.s && lhs.e == rhs.e
    }
}
var palindrome = Set<Pair>()

func solution(_ s:String) -> Int {
    if s == String(s.reversed()) {
        return s.count
    }
    var str = Array(s)
    var maxLength = 1
    // 길이 1 펠린
    for i in 0..<s.count {
        palindrome.insert(Pair(s: i, e: i))
    }
    
    // 길이 2 펠린
    for i in 0..<s.count-1 {
        if str[i] == str[i+1] {
            palindrome.insert(Pair(s: i, e: i+1))
            maxLength = 2
        }
    }
    
    if s.count < 3 {
        return maxLength
    }
    
    // 길이 3 이상 펠린
    for length in 3...s.count {
        for start in 0..<s.count-length+1 {
            let end = start + length-1
            guard str[start] == str[end] else { continue }
            let target = Pair(s: start+1, e: end-1)
            if palindrome.contains(target) {
                palindrome.insert(Pair(s: start, e: end))
                maxLength = length
            }
        }
    }
    
    return maxLength
}
