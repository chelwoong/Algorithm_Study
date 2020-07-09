
func solution(_ s:String) -> String {
    var before: Character = " "
    let jaden = s.map { c -> Character in
        if before.isWhitespace {
            let newChar = Character(c.uppercased())
            before = newChar
            return newChar
        }
        let newChar = Character(c.lowercased())
        before = newChar
        return newChar
    }
    return String(jaden)
}


/* 개선된 풀이 */
func solution(_ s:String) -> String {
    var before: Character = " "
    var str = s.lowercased()
    let jaden = str.map { c -> Character in
        let newChar = before.isWhitespace ? Character(c.uppercased()) : c
        before = newChar
        return newChar
    }
    return String(jaden)
}
