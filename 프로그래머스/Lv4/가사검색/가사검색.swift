import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    var count = 0
    weak var parentNode: TrieNode?
    var children = [T:TrieNode]()
    
    init(value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }
    
    func add(value: T) {
        guard children[value] == nil else { return }
        children[value] = TrieNode(value: value, parentNode: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
}

extension Trie {
    func childCount(query: String) -> Int {
        guard !query.isEmpty else { return 0 }
        
        var currentNode = root
        for char in query {
            if char == "?" {
                return currentNode.count
            }
            guard let childNode = currentNode.children[char] else {
                return 0
            }
            currentNode = childNode
        }
        return currentNode.children.count
    }
    
    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        for char in word {
            currentNode.count += 1
            if let childNode = currentNode.children[char] {
                currentNode = childNode
            } else {
                currentNode.add(value: char)
                currentNode = currentNode.children[char]!
            }
        }
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var tries = [Int:Trie]()
    var reverseTries = [Int:Trie]()
    var result = [Int]()
    
    for word in words {
        if let trie = tries[word.count] {
            trie.insert(word: word)
        } else {
            tries[word.count] = Trie()
            tries[word.count]?.insert(word: word)
        }
        
        if let trie = reverseTries[word.count] {
            trie.insert(word: String(word.reversed()))
        } else {
            reverseTries[word.count] = Trie()
            reverseTries[word.count]?.insert(word: String(word.reversed()))
        }
    }
    
    for query in queries {
        let prefix = query.first == "?"
        if prefix {
            if let trie = reverseTries[query.count] {
                result.append(trie.childCount(query: String(query.reversed())))
            } else {
                result.append(0)
            }
        } else {
            if let trie = tries[query.count] {
                result.append(trie.childCount(query: query))
            } else {
               result.append(0)
           }
        }
    }
    return result
}

//func solution(_ words:[String], _ queries:[String]) -> [Int] {
//
//    var result = [Int]()
//    var queryTable = [String:Int]()
//    for query in queries {
//        if let validCount = queryTable[query] {
//            result.append(validCount)
//            continue
//        }
//
//        var validCount = 0
//        for word in words {
//            guard word.count == query.count else { continue }
//            if isValid(word: word, query: query) {
//                validCount += 1
//            }
//        }
//        result.append(validCount)
//        queryTable[query] = validCount
//    }
//    return result
//}
//
//
//func isValid(word: String, query: String) -> Bool {
//    let prefixQuestion = query.first == "?"
//    var qIndex = prefixQuestion ? query.index(before: query.endIndex) : query.startIndex
//    let word = prefixQuestion ? String(word.reversed()) : word
//
//    for w in word {
//        let q = query[qIndex]
//        guard q != "?" else { return true }
//        if w != q {
//            return false
//        }
//        qIndex = prefixQuestion ? query.index(before: qIndex) : query.index(after: qIndex)
//    }
//    return true
//}

print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?", "?????"]))

