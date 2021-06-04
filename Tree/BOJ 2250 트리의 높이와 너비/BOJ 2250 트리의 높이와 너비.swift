class Node {
    var parents: Node?
    var leftChild: Node?
    var rightChild: Node?
    var idx: Int
    var level = 0
    var x = 0
    
    init(_ idx: Int) {
        self.idx = idx
    }
    
    func markWhileInOrder(currentX: inout Int) {
        self.level = (parents?.level ?? 0) + 1
        if diffenceInLevel.count-1 < level {
            diffenceInLevel.append((n, 0))
        }
        
        leftChild?.markWhileInOrder(currentX: &currentX)
        self.x = currentX
        currentX += 1
        rightChild?.markWhileInOrder(currentX: &currentX)
        
        if x < diffenceInLevel[level].min {
            diffenceInLevel[level].min = x
        }
        if x > diffenceInLevel[level].max {
            diffenceInLevel[level].max = x
        }
    }
}

let n = Int(readLine()!)!
var tree = (0..<n).map { Node($0) }
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (idx, left, right) = (input[0]-1, input[1]-1, input[2]-1)
    
    if left >= 0 {
        tree[idx].leftChild = tree[left]
        tree[left].parents = tree[idx]
    }
    if right >= 0 {
        tree[idx].rightChild = tree[right]
        tree[right].parents = tree[idx]
    }
}

var diffenceInLevel: [(min: Int, max: Int)] = [(0, 0)]
let root = tree.filter({ $0.parents == nil })[0]
var currentX = 1
root.markWhileInOrder(currentX: &currentX)

var maxDiffLevel = 0
var maxDiff = 0
for level in 1..<diffenceInLevel.count {
    let diff = abs(diffenceInLevel[level].min - diffenceInLevel[level].max)+1
    if maxDiff < diff {
        maxDiff = diff
        maxDiffLevel = level
    }
}
print("\(maxDiffLevel) \(maxDiff)")
