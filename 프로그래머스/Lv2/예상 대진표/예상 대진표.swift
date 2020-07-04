import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var a = a
    var b = b
    var round = 1
    while (a+1)/2 != (b+1)/2 {
        a = (a+1)/2
        b = (b+1)/2
        round += 1
    }

    return round
}
