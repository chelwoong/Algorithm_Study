
// kakao blind 2018 1차 캐시
// https://programmers.co.kr/learn/courses/30/lessons/17680


// MARK: 기본 배열

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cacheHit = 1
    let cacheMiss = 5
    var cacheList = [String]()
    var excuteTime = 0
    
    for city in cities {
        let city = city.lowercased()
        if cacheList.contains(city) {
            excuteTime += cacheHit
            cacheList.remove(at: cacheList.firstIndex(of: city)!)
            cacheList.append(city)
        } else {
            excuteTime += cacheMiss
            cacheList.append(city)
            if cacheList.count > cacheSize {
                cacheList.removeFirst()
            }
        }
    }
    
    return excuteTime
}

// MARK: Linked List

class CacheList {
    class Cache {
        var value: String
        weak var previous: Cache?
        var next: Cache?
        
        init(value: String) {
            self.value = value
        }
    }
    
    var table = [String:Cache]()
    var head: Cache?
    var tail: Cache?
    var count = 0
    
    func append(value: String) {
        guard let _ = head else {
            head = Cache(value: value)
            tail = head
            table[value] = head
            return
        }
        let newNode = Cache(value: value)
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
        table[value] = newNode
    }
    
    func delete(node: Cache) {
        let prev = node.previous
        let next = node.next

        prev?.next = next
        next?.previous = prev
        table[node.value] = nil
        if node.value == tail?.value {
            tail = tail?.previous
        }
        node.previous = nil
        node.next = nil
    }
    
    func removeHead() {
        guard let head = head else { return }
        self.head = head.next
        table[head.value] = nil
        
    }
    
    func moveToTail(from cache: Cache) {
        guard cache.value != tail?.value else { return }
        if head?.value == cache.value {
            head = head?.next
        }
        
        let prev = cache.previous
        let next = cache.next
        prev?.next = next
        next?.previous = prev
        
        cache.next = nil
        cache.previous = tail
        tail?.next = cache
        tail = cache

    }
}


func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cacheHit = 1
    let cacheMiss = 5
    let cacheList = CacheList()
    var excuteTime = 0
    
    for city in cities {
        let city = city.lowercased()
        if let cache = cacheList.table[city] {
//            print(city)
//            print(cacheList.table)
            excuteTime += cacheHit
            cacheList.moveToTail(from: cache)
        } else {
//            print(city)
//            print(cacheList.table)
            excuteTime += cacheMiss
            cacheList.append(value: city)
            if cacheList.table.count > cacheSize {
                cacheList.removeHead()
            }
        }
    }

    return excuteTime
}

 print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))

// print(solution(0, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))

// print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))


