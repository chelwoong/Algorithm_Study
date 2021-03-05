let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var islands = [[(Int, Int)]](repeating: [], count: nm[0]+1)

var low = 0
var high = 0

for _ in 0..<nm[1] {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    islands[abc[0]].append((abc[1], abc[2]))
    islands[abc[1]].append((abc[0], abc[2]))
    high = max(high, abc[2])
}
let ab = readLine()!.split(separator: " ").map { Int(String($0))! }

var mostWeight = 0
while low <= high {
    let mid = (low + high)/2

    if canMove(for: mid) {
        mostWeight = mid
        low = mid+1
    } else {
        high = mid-1
    }
}

func canMove(for weight: Int) -> Bool {
    var visited = Set<Int>([ab[0]])
    var q: [Int] = [ab[0]]
    
    while !q.isEmpty {
        let curr = q.removeFirst()
        for (island, w) in islands[curr] where w >= weight {
            if island == ab[1] {
                return true
            }
            guard !visited.contains(island) else { continue }
            visited.insert(island)
            q.append(island)
        }
    }
    return false
}

print(mostWeight)
