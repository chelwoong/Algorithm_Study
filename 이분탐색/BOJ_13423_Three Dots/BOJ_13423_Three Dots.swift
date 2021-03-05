
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let dots = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    
    var sameDots = 0
    for center in 0..<n {
        var low = 0
        var high = n-1
        
        while low < high {
            let lowDist = dots[center] - dots[low]
            let highDist = dots[high] - dots[center]
            
            if lowDist == highDist {
                sameDots += 1
                low += 1
            } else if lowDist > highDist {
                low += 1
            } else {
                high -= 1
            }
        }
    }
    print(sameDots)
    
    // MARK: 이분탐색
    
//    func search(_ num: Int) -> Int? {
//        var low = 0
//        var high = n-1
//        while low <= high {
//            let mid = (low + high)/2
//            if num == dots[mid] {
//                return mid
//            } else if num < dots[mid] {
//                high = mid-1
//            } else {
//                low = mid+1
//            }
//        }
//
//        return nil
//    }
//
//    var sameDots = 0
//    for i in 0..<n {
//        for m in i+1..<n {
//            let distance = dots[m] - dots[i]
//            if search(dots[m] + distance) != nil {
//                sameDots += 1
//            }
//        }
//    }
//
//    print(sameDots)
}
