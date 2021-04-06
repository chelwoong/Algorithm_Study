let nc = readLine()!.split(separator: " ").map { Int(String($0))! }
let products = readLine()!.split(separator: " ").map { Int(String($0))! }

func partition(_ idx: Int, _ to: Int, _ array: inout [Int], _ sum: Int) {
    guard sum <= nc[1] else { return }
    guard idx < to else { array.append(sum); return }
    
    partition(idx+1, to, &array, sum + products[idx])
    partition(idx+1, to, &array, sum)
}

var sumA = [Int]()
var sumB = [Int]()
partition(0, products.count/2, &sumA, 0)
partition(products.count/2, products.count, &sumB, 0)

sumB.sort()

func binarySearchUpperBounds(target: Int) -> Int {
    var low = 0
    var high = sumB.count
    
    while low < high {
        let mid = (low + high)/2
        if target < sumB[mid] {
            high = mid
        } else {
            low = mid+1
        }
    }
    
    return low
}

var getCase = 0
for a in sumA {
    
    let upper = binarySearchUpperBounds(target: nc[1] - a)
    getCase += upper
}

print(getCase)
