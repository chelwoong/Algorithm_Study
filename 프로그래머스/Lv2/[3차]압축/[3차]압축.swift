
func solution(_ msg:String) -> [Int] {
    var wordTable = makeTable()
    let msg = Array(msg).map { String($0) }
    var printIndices = [Int]()
    var offset = 0
    while offset < msg.count {
        var w = msg[offset]
        var idx = wordTable[w]!
        offset += 1
        
        while offset < msg.count {
            w += msg[offset]
            if let index = wordTable[w] {
                idx = index
                offset += 1
                continue
            }
            break
        }
        
        printIndices.append(idx+1)
        wordTable[w] = wordTable.count
        // print("\(w) : \(wordTable[w]!), \(idx+1)")
    }
    
    return printIndices
}

func makeTable() -> [String:Int] {
    var wordTable = [String:Int]()
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated().forEach {
        wordTable["\($0.element)"] = $0.offset
    }
    return wordTable
}
// [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
 print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
 print(solution("ABABABABABABABAB"))
