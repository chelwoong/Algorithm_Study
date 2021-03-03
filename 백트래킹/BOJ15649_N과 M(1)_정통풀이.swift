protocol Readable {
    func readSingleValue() -> String
    func readArray(with separator: Character) -> [String]
}

extension Readable {
    func readSingleValue() -> String {
        return readLine()!
    }
    
    func readSingleValue() -> Int {
        return Int(readLine()!)!
    }
    
    func readArray(with separator: Character) -> [String] {
        return readLine()!.split(separator: " ").map { String($0) }
    }
    
    func readArray(with separator: Character) -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }
}

class BOJ15649_N과M1: Readable {
    
    func input() {
        let data: [Int] = readArray(with: " ")
        n = data[0]
        array = [Int](repeating: 0, count: data[1])
        isUsed = [Bool](repeating: false, count: n+1)
    }
    
    // MARK: Properties
    
    var n: Int!
    var array: [Int]!
    var isUsed: [Bool]!
    
    // MARK: Solution
    
    func solution() {
        input()
        backTracking(digit: 0)
    }
    
    func backTracking(digit: Int) {
        guard digit < array.count else {
            print(array.reduce(into: "", { $0 += "\($1) "}))
            return
        }
        
        for i in 1...n {
            guard !isUsed[i] else { continue }
            isUsed[i] = true
            array[digit] = i
            backTracking(digit: digit+1)
            isUsed[i] = false
        }
    }
}

BOJ15649_N과M1().solution()
