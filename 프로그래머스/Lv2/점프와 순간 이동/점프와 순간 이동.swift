import Foundation

func solution(_ n:Int) -> Int
{
    var cost = 0
    var n = n
    
    while n != 0 {
        while n % 2 == 0 {
            n /= 2
        }
        n -= 1
        cost += 1
    }
    
    return cost
}
