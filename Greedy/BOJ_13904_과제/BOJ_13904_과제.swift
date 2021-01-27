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

class BOJ13904: Readable {
    
    func input() {
        n = readSingleValue()
        for _ in 0..<n {
            let data: [Int] = readArray(with: " ")
            works.append((data[0], data[1]))
        }
    }
    
    // MARK: Properties
    
    var n: Int!
    var works = [(dueDate: Int, score: Int)]()
    
    // MARK: Solution
    
    func solution() {
        input()
        works.sort(by: { $0.score > $1.score })
        var timeTable = [Bool](repeating: false, count: 1001)
        var score = 0
        
        for work in works {
            var dueDate = work.dueDate
            while timeTable[dueDate], dueDate > 0 {
                dueDate -= 1
            }
            
            if dueDate != 0 {
                timeTable[dueDate] = true
                score += work.score
            }
        }
        print(score)
    }
}

BOJ13904().solution()
