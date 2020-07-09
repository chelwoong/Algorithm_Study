import Foundation

enum Operation: Character {
    case multiple = "*"
    case plus = "+"
    case minus = "-"
    
    func operate(_ n1: Int64, _ n2: Int64) -> Int64 {
        switch self {
            case .multiple: return n1 * n2
            case .plus: return n1 + n2
            case .minus: return n1 - n2
            default: return -1
        }
    }
}

func operate(numbers: [Int64], opers: [Character], prior: [Operation]) -> Int64 {
    var numbers = numbers
    var opers = opers
    for oper in prior {
        while let index = opers.firstIndex(of: oper.rawValue) {
            numbers[index] = oper.operate(numbers[index], numbers[index+1])
            numbers.remove(at: index+1)
            opers.remove(at: index)
        }
    }
    return abs(numbers[0])
}

func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["*", "+", "-"]).map{abs(Int64($0)!)}
    let opers = Array(expression.filter({ Int(String($0)) == nil}))
    let myOper = "*+-"
    var maxValue: Int64 = 0
    
    for first in myOper {
        for second in myOper {
            guard first != second else { continue }
            let third = "*+-".filter({$0 != first && $0 != second})[0]
            let result = operate(numbers: numbers, opers: opers, prior: [
                Operation(rawValue: first)!,
                Operation(rawValue: second)!,
                Operation(rawValue: third)!
            ])
            maxValue = max(maxValue, result)
        }
    }
    
    
    return maxValue
}
