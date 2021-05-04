import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    func compress(_ origin: (r: Int, c: Int), _ size: Int) -> [Int] {
        guard size > 1 else {
            return arr[origin.r][origin.c] == 0 ? [1, 0] : [0, 1]
        }
        
        var areas = [[Int]](repeating: [Int](), count: 4)
        areas[0] = compress(origin, size/2)
        areas[1] = compress((origin.r, origin.c + size/2), size/2)
        areas[2] = compress((origin.r+size/2, origin.c), size/2)
        areas[3] = compress((origin.r+size/2, origin.c+size/2), size/2)
        
        var zero = 0
        var one = 0
        areas.forEach {
            zero += $0[0]
            one += $0[1]
        }
        
        if zero == 0 {
            return [0, 1]
        } else if one == 0 {
            return [1, 0]
        } else {
            return [zero, one]
        }
    }
    
    
    return compress((0,0), arr.count)
}
