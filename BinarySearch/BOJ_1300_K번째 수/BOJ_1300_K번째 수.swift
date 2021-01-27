

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

class BOJ1300: Readable {
    
    func input() {
        n = readSingleValue()
        k = readSingleValue()
    }
    
    // MARK: Properties
    
    var n: Int!
    var k: Int!
    
    // MARK: Solution
    
    func solution() {
        input()
        
        var low = 0
        var high = k!
        
        while low <= high {
            let m = (low + high) / 2
            var sum = 0
            for i in 1...n {
                sum += min(m / i, n)
            }
            if sum >= k {
                high = m-1
            } else {
                low = m+1
            }
        }
        print(low)
    }
}

BOJ1300().solution()
