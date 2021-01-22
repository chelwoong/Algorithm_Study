
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

class BOJ2003: Readable {
    
    func input() {
        let data: [Int] = readArray(with: " ")
        target = data[1]
        array = readArray(with: " ")
    }
    
    // MARK: Properties
    
    var array: [Int]!
    var target: Int!
    
    // MARK: Solution
    
    func solution() {
        input()
        
        var result = 0
        var first = 0
        var second = 0
        var sum = array[0]
        while first < array.count, second < array.count {
            if sum == target {
                result += 1
                first += 1
                if first < array.count {
                    sum += array[first]
                }
            } else if sum > target {
                sum -= array[second]
                second += 1
            } else {
                first += 1
                if first < array.count {
                    sum += array[first]
                }
            }
        }
        print(result)
    }
}

BOJ2003().solution()
