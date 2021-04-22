

func prefixTable(_ str: String) -> [Int] {
    let group = Array(str)
    var begin = 0
    var pi = [Int](repeating: 0, count: group.count)
    
    for i in 1..<group.count {
        while group[i] != group[begin], begin > 0 {
            begin = pi[begin-1]
        }
        if group[i] == group[begin] {
            begin += 1
            pi[i] = begin
        }
    }
    
    return pi
}

func kmp(_ str: String, _ group: String) -> [Int] {
    let pi = prefixTable(group)
    let text = Array(str)
    let group = Array(group)
    var matching = [Int]()
    var j = 0
    
    for i in 0..<text.count {
        while text[i] != group[j], j > 0 {
            j = pi[j-1]
        }
        if text[i] == group[j] {
            if j == group.count-1 {
                matching.append(i-j+1)
                j = pi[j]
            } else {
                j += 1
            }
        }
    }
    return matching
}

let text = readLine()!
let pattern = readLine()!

let matching = kmp(text, pattern)
print(matching.count)
print(matching.map { String($0) }.joined(separator: " "))
