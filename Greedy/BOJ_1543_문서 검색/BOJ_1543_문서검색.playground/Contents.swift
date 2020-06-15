let text = Array(readLine()!)
let word = Array(readLine()!)

// 시간 매우 많이 걸림 648ms? 약.. 30배 넘게 느림..
func findMatching(text: String) -> Int {
    guard text.count >= word.count else { return 0 }
    var temp = 0
    var matching = 0
    for t in text {
        if t == word[temp] {
            if temp == word.count-1 {
                matching += 1
                temp = 0
            } else {
                temp += 1
            }
        } else {
            temp = 0
        }
    }
    return matching
}

func findMatching(index idx: Int) -> Int {
    var i = idx
    var wIdx = 0
    var matching = 0
    while i < text.count {
        if text[i] == word[wIdx] {
            if wIdx == word.count-1 {
                matching += 1
                wIdx = 0
            } else {
                wIdx += 1
            }
        } else {
            wIdx = 0
        }
        i += 1
    }
    return matching
}


var result = 0
for i in 0..<text.count {
    //let matching = findMatching(text: String(text.dropFirst(i)))
    let matching = findMatching(index: i)
    result = max(result, matching)
}
print(result)
