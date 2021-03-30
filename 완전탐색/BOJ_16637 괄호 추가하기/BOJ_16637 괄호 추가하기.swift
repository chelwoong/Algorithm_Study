let n = Int(readLine()!)!
var numbers = [Int]()
var operators = [Character]()
var maxResult = Int.min

for char in readLine()! {
    if char.isNumber {
        numbers.append(Int(String(char))!)
    } else {
        operators.append(char)
    }
}

var hasBracket = [Bool](repeating: false, count: operators.count)
func selectBracket(_ idx: Int) {
    guard idx < hasBracket.count else {
        calcuate()
        return
    }
    
    hasBracket[idx] = true
    selectBracket(idx+2)
    hasBracket[idx] = false
    selectBracket(idx+1)
}

func operate(_ a: Int, _ b: Int, _ opr: Character) -> Int {
    switch opr {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        default: return 0
    }
}

func calcuate() {
    var operating = numbers
    
    for bracketIdx in hasBracket.indices where hasBracket[bracketIdx] {
        operating[bracketIdx] = operate(operating[bracketIdx], operating[bracketIdx+1], operators[bracketIdx])
    }
    
    for (idx, opr) in operators.enumerated() {
        operating[idx+1] = hasBracket[idx] ? operating[idx] : operate(operating[idx], operating[idx+1], opr)
    }
    
    if maxResult < operating.last! {
        maxResult = operating.last!
    }
}

selectBracket(0)
print(maxResult)
