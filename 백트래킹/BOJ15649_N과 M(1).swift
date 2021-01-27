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

// MARK: 백트래킹
class BOJ15649: Readable {
    
    func input() {
        let data: [Int] = readArray(with: " ")
        n = data[0]
        length = data[1]
    }
    
    // MARK: Properties
    
    var n: Int!
    var length: Int!
    
    // MARK: Solution
    
    func solution() {
        input()
        
        for i in 1...n {
            track(num: i, numbers: [i])
        }
    }
    
    func track(num: Int, numbers: [Int]) {
        guard numbers.count < length else {
            print(numbers.reduce(into: "", { $0 += "\($1) "}).dropLast())
            return
        }
        guard num <= n else { return }
        for i in 1...n where !numbers.contains(i) {
            track(num: i, numbers: numbers + [i])
        }
    }
}

BOJ15649().solution()
