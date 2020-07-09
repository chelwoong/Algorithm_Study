import Foundation

func solution(_ s:String) -> Bool
{
    var openStack = [Character]()
    for c in s {
        if c == "(" {
            openStack.append(c)
        } else if c == ")", !openStack.isEmpty {
            openStack.removeLast()
        } else {
            return false
        }
    }
    return openStack.isEmpty ? true : false
}
