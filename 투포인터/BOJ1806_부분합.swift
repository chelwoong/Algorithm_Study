

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

class BOJ1806: Readable {
    
    func input() {
        let data: [Int] = readArray(with: " ")
        target = data[1]
        array = readArray(with: " ")
    }
    
    // MARK: Properties
    
    var target: Int!
    var array: [Int]!
    
    // MARK: Solution
    
    func solution() {
        input()
        
        var smallSize = 0
        var lead = 0
        var second = 0
        var sum = array[0]
        
        while lead < array.count, second < array.count {
            if sum >= target {
                let size = lead - second + 1
                if smallSize == 0 || smallSize > size {
                    smallSize = size
                }
                sum -= array[second]
                second += 1
            } else {
                lead += 1
                if lead < array.count {
                    sum += array[lead]
                }
            }
        }
        
        print(smallSize)
    }
}

BOJ1806().solution()
