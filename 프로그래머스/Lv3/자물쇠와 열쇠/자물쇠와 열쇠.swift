import Foundation

func isOpen(lock: [[Int]]) -> Bool {
    return !lock.contains { $0.contains(0) }
}

func insert(key: [[Int]], lock: [[Int]], to index: (row: Int, col: Int)) -> Bool {

    var insertedLock = lock
    
    //print(key, lock, index.row, index.col)
    
    for r in 0..<key.count {
        for c in 0..<key.count {
            let lockRow = r + index.row
            let lockCol = c + index.col

            //print(lockRow, lockCol)
            guard
                lockRow >= 0,
                lockCol >= 0,
                lockRow < lock.count,
                lockCol < lock.count
                else {
                    //print("out of index")
                    continue
            }
            
            if lock[lockRow][lockCol] == 1, key[r][c] == 1 { return false }
            guard lock[lockRow][lockCol] == 0, key[r][c] == 1 else { continue }
            
            
            //print("changed, \(r), \(c)")
            insertedLock[lockRow][lockCol] = 1
        }
    }
    
    return isOpen(lock: insertedLock)
}

func rotateRight(key: [[Int]]) -> [[Int]] {

    var turnedKey = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)
    
    let maxKey = key.count-1
    
    for r in 0...maxKey {
        for c in 0...maxKey {
            turnedKey[c][maxKey-r] = key[r][c]
        }
    }
    
    return turnedKey
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var rotatedKey = key
    
    for _ in 0..<4 {
        //printLock(rotatedKey)
        for r in -(key.count-1)..<lock.count {
            for c in -(key.count-1)..<lock.count {
                if insert(key: rotatedKey, lock: lock, to: (row: r, col: c)) {
                    return true
                }
            }
        }
        rotatedKey = rotateRight(key: rotatedKey)
    }
    
    return false
}
