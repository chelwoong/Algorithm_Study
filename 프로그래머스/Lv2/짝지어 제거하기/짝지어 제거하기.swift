import Foundation

func solution(_ s:String) -> Int{
    var characterStack = [Character]()
    for c in s {
        if let pair = characterStack.last, pair == c {
            characterStack.removeLast()
        } else {
            characterStack.append(c)
        }
    }
    return characterStack.isEmpty ? 1 : 0
}
