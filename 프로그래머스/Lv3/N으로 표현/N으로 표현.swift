import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    var nSet = [Set<Int>](repeating: Set<Int>(), count: 9)
    
    for use in 1...8 {
        nSet[use].insert(Int(String(repeating: "\(N)", count: use))!)
        
        for i in 1..<use {
            nSet[i].forEach { a in
                nSet[use-i].forEach { b in
                    let set = [a+b, a*b, a-b, a/b]
                    set.filter { 1...32000 ~= $0 }
                        .forEach { nSet[use].insert($0) }
                }
            }
        }
        
        if nSet[use].contains(number) {
            return use
        }
    }
    
    return -1
}

print(solution(5, 12))
print(solution(2, 11))
