
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    let string = radixString(radix: n, turn: t, member: m)
    var result = ""
    
    var turn = 0
    while turn < t {
        result.append(string[p-1 + m * turn])
        turn += 1
    }
    
    return result
}


func radixString(radix n: Int, turn: Int, member: Int) -> [Character] {
    var string = [Character]()
    var idx = 0
    while string.count <= turn * member {
        string += Array(String(idx, radix: n).uppercased())
        idx += 1
    }
    return string
}

print(solution(2, 4, 2, 1))
print(solution(16, 16, 2, 1))
