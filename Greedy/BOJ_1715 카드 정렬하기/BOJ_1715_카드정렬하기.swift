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

class BOJ1339: Readable {
    
    func input() {
        for _ in 0..<readSingleValue() {
            var string: String = readSingleValue()
            var digit = 0
            while !string.isEmpty {
                let number = string.removeLast()
                digits[number, default: [Int](repeating: 0, count: 8)][digit] += 1
                digit += 1
            }
        }
    }
    
    // MARK: Properties
    
    var digits = [Character: [Int]]()
    
    // MARK: Solution
    
    func solution() {
        input()
        let orderedDigits = orderDigits()
        var maxNumber = 9
        var result = 0
        for (_, counting) in orderedDigits {
            result += makeSum(number: maxNumber, counting: counting)
            maxNumber -= 1
        }
        print(result)
    }
    
    func power(_ number: Int, count: Int) -> Int {
        var powered = 1
        (0..<count).forEach { _ in powered *= number }
        return powered
    }
    
    func orderDigits() -> [(Character, [Int])] {
        return digits.sorted { (counting1, counting2) -> Bool in
            return makeSum(number: 1, counting: counting1.value) > makeSum(number: 1, counting: counting2.value)
        }
    }
    
    func makeSum(number: Int, counting: [Int]) -> Int {
        var result = 0
        for (digit, count) in counting.enumerated() {
            result += number * count * power(10, count: digit)
        }
        return result
    }
}

BOJ1339().solution()
