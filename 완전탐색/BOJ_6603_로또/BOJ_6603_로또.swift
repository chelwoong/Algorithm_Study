func select(index: Int, count: Int) {
    if count == lottoNumberCount {
        for (idx, isSelect) in lotto.enumerated() {
            if isSelect {
                print(numbers[idx], terminator: " ")
            }
        }
        print()
        return
    }
    if index >= lotto.count {
        return
    }
    
    lotto[index] = true
    select(index: index+1, count: count+1)
    lotto[index] = false
    select(index: index+1, count: count)
}

let lottoNumberCount = 6
var lotto = [Bool]()
var numbers = [Int]()

while let n = readLine()?.split(separator: " ").map({Int($0)!}) {
    if n.count == 1, n[0] == 0 {
        break
    }
    numbers = [Int](n.dropFirst())
    numbers.sort()
    lotto = [Bool](repeating: false, count: numbers.count)
    
    select(index: 0, count: 0)
    print()
}
