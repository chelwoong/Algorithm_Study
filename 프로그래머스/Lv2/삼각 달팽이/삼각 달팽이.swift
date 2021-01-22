import Foundation

func solution(_ n:Int) -> [Int] {
    
    var array = configureTriangle(for: n)
    var currentPoint: (Int, Int) = (0, 0)
    var current = 1
    
    while isInRange(current: currentPoint, n: n),
        array[currentPoint.0][currentPoint.1] == 0 {
        
        // left
        while isInRange(current: currentPoint, n: n), array[currentPoint.0][currentPoint.1] == 0 {
            
            array[currentPoint.0][currentPoint.1] = current
            currentPoint.0 += 1
            current += 1
        }
        currentPoint.0 -= 1
        currentPoint.1 += 1
        
        // bottom
        while isInRange(current: currentPoint, n: n), array[currentPoint.0][currentPoint.1] == 0 {
            
            array[currentPoint.0][currentPoint.1] = current
            currentPoint.1 += 1
            current += 1
        }
        
        currentPoint.0 -= 1
        currentPoint.1 -= 2
        
        // right
        while isInRange(current: currentPoint, n: n),
            array[currentPoint.0][currentPoint.1] == 0 {
            
            array[currentPoint.0][currentPoint.1] = current
            currentPoint.0 -= 1
            currentPoint.1 -= 1
            current += 1
        }
        
        currentPoint.0 += 2
        currentPoint.1 += 1
    }
    
    return array.flatMap { $0 }
}

func isInRange(current: (Int, Int), n: Int) -> Bool {
    return 0..<n ~= current.0 &&
        current.1 <= current.0
}

func configureTriangle(for n: Int) -> [[Int]] {
    var array = [[Int]]()
    
    for count in 1...n {
        let arr = [Int](repeating: 0, count: count)
        array.append(arr)
    }
    
    return array
}

print(solution(5))
