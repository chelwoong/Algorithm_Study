import UIKit

var array = [1, 5, 7, 15, 22, 65, 80, 100]

func binarySearch(arr: [Int], target: Int) -> Int? {
    var low = 0
    var high = arr.count-1
    var mid = Int.min

    while low <= high {
        mid = (low + high)/2

        if arr[mid] == target {
            return mid
        } else if target < arr[mid] {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    return nil
}

func binarySearchRecurse(_ arr: [Int], _ target: Int, from low: Int, to high: Int) -> Int? {
    guard low < high else { return nil }
    
    let mid = (low + high)/2
    
    if arr[mid] == target {
        return mid
    } else if target < arr[mid] {
        return binarySearchRecurse(arr, target, from: low, to: mid-1)
    } else {
        return binarySearchRecurse(arr, target, from: mid+1, to: high)
    }
}



//binarySearch(arr: array, target: 80)
binarySearchRecurse(array, 65, from: 0, to: array.count-1)
