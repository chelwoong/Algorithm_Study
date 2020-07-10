import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var people = 0
    var used = Set<String>()
    var before = "" {
        didSet {
            used.insert(before)
        }
    }
    var turn = 0
    var hasLoser = false

    for word in words {
        if people == 0 {
            turn += 1
        }
        if before.isEmpty {
            before = word
            people += 1
            continue
        }
        guard before.last == word.first, !used.contains(word) else {
            hasLoser = true
            break
        }
        before = word
        people = (people+1) % n
    }
    return hasLoser ? [people+1, turn] : [0, 0]
}
