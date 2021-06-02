
var n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var initCountTable = [Int](repeating: 0, count: 21)
var countTable = initCountTable
var nextCountTable = initCountTable

func play(_ idx: Int) {
    guard idx < numbers.count-1 else {
        print(countTable[numbers[numbers.count-1]])
        return
    }
    
    nextCountTable = initCountTable
    countTable.enumerated().forEach { (number, count) in
        guard count != 0 else { return }
        let addition = number + numbers[idx]
        let subtraction = number - numbers[idx]
        
        if addition >= 0, addition <= 20 {
            nextCountTable[addition] += count
        }
        if subtraction >= 0, subtraction <= 20 {
            nextCountTable[subtraction] += count
        }
    }
    countTable = nextCountTable
    play(idx+1)
}

countTable[numbers[0]] = 1
play(1)
