
class SegmentTree {
    var value: (min: Int, max: Int)
    var function: ((min: Int, max: Int), (min: Int, max: Int)) -> (min: Int, max: Int)
    var leftBounds: Int
    var rightBounds: Int
    var leftChild: SegmentTree?
    var rightChild: SegmentTree?
    
    init(_ array: [Int], _ leftBounds: Int, _ rightBounds: Int, _ function: @escaping ((min: Int, max: Int), (min: Int, max: Int)) -> (min: Int, max: Int)) {
        self.leftBounds = leftBounds
        self.rightBounds = rightBounds
        self.function = function
        
        if leftBounds == rightBounds {
            self.value = (array[leftBounds], array[rightBounds])
        } else {
            let middle = (leftBounds + rightBounds)/2
            
            self.leftChild = SegmentTree(array, leftBounds, middle, function)
            self.rightChild = SegmentTree(array, middle+1, rightBounds, function)
            self.value = function(leftChild!.value, rightChild!.value)
        }
    }
    
    func query(leftBounds: Int, rightBounds: Int) -> (Int, Int) {
        if self.leftBounds == leftBounds, self.rightBounds == rightBounds {
            return value
        }
        
        guard let leftChild = leftChild, let rightChild = rightChild else { fatalError() }
        
        if leftChild.rightBounds < leftBounds {
            return rightChild.query(leftBounds: leftBounds, rightBounds: rightBounds)
        } else if rightChild.leftBounds > rightBounds {
            return leftChild.query(leftBounds: leftBounds, rightBounds: rightBounds)
        } else {
            let leftValue = leftChild.query(leftBounds: leftBounds, rightBounds: leftChild.rightBounds)
            let rightValue = rightChild.query(leftBounds: rightChild.leftBounds, rightBounds: rightBounds)
            return function(leftValue, rightValue)
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var numbers = [Int]()

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

let tree = SegmentTree(numbers, 0, numbers.count-1) { (a, b) -> (min: Int, max: Int) in
    let min = a.min < b.min ? a.min : b.min
    let max = a.max > b.max ? a.max : b.max
    return (min, max)
}

for _ in 0..<m {
    let bounds = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (min, max) = tree.query(leftBounds: bounds[0]-1, rightBounds: bounds[1]-1)
    print("\(min) \(max)")
}
