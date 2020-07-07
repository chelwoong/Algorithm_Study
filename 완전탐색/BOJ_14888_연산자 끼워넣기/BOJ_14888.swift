let n = readLine()!
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var operators = readLine()!.split(separator: " ").map{Int($0)!}
var maximum = Int.min
var minimum = Int.max

func operate(number1 n1: Int, number2 n2: Int, operator opr: Int) -> Int {
    switch opr {
    case 0: return n1 + n2
    case 1: return n1 - n2
    case 2: return n1 * n2
    case 3: return n1 / n2
    default: return -1
    }
}

func operate(numbers: [Int], operators: [Int]) {
    if numbers.count <= 1 {
        maximum = max(maximum, numbers[0])
        minimum = min(minimum, numbers[0])
        return
    }
    
    for opr in 0..<operators.count {
        if operators[opr] == 0 { continue }
        let n1 = numbers[numbers.count-1]
        let n2 = numbers[numbers.count-2]
        let oprResult = operate(number1: n1, number2: n2, operator: opr)
        
        var remainOprs = operators
        remainOprs[opr] -= 1
        
        var operatedNumbers = [Int](numbers.dropLast(2))
        operatedNumbers.append(oprResult)
        
        operate(numbers: operatedNumbers, operators: remainOprs)
    }
}

operate(numbers: numbers.reversed(), operators: operators)
print(maximum)
print(minimum)
