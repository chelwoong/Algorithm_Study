//
//  main.swift
//  BOJ2352_반도체 설계
//
//  Created by woong on 2020/06/11.
//  Copyright © 2020 woong. All rights reserved.
//

let n = Int(readLine()!)!
let ports = readLine()!.split(separator: " ").map{Int(String($0))!}

// O(logN)
func binSearchLower(array arr: [Int], target: Int) -> Int {
    var low = 0
    var high = arr.count
    var mid = 0
    
    while low < high {
        mid = (low + high)/2
        
        if target <= arr[mid] {
            high = mid
        } else {
            low = mid+1
        }
    }
    return low < arr.count ? low : arr.count-1
}

// Longest Incresing sequence
// O(N)
func findLIS(array ports: [Int]) -> Int {
    var arr = [Int]()
    for port in ports {
        // minIncreses의 마지막 값보다 크면 푸시, 아니면 위치를 찾아서 바꿔준다.
        if arr.isEmpty || port > arr.last! {
            arr.append(port)
        } else {
            let index = binSearchLower(array: arr, target: port)
            arr[index] = port
            //print(port, index, arr)
        }
    }
    
    return arr.count
}

func main() {
    // O(nlogN)
    let lis = findLIS(array: ports)
    print(lis)
}

main()


// MARK: 시간초과

//var connects = [Bool](repeating: false, count: n+1)
//connects[0] = true
//var minIndex = Int.max
//var i = 0
//var minPort = 0
//var tempCount = 0
//var result = 0
//
//while connects.contains(false) {
//    i += 1
//    if i > n {
//        i = connects.firstIndex(of: false)!
//        minPort = 0
//        tempCount = 0
//    }
//    guard !connects[i] else { continue }
//
//    if port[i-1] > minPort {
//        minIndex = min(minIndex, i)
//        connects[i] = true
//        minPort = port[i-1]
//        tempCount += 1
//        result = max(result, tempCount)
//    }
//}


