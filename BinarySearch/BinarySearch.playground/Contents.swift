import UIKit

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

func binarySearchUpperBounds(_ arr: [Int], _ target: Int) -> Int {
    var low = 0
    var high = arr.count
    var mid = 0
        
    while low < high {
        mid = (low + high)/2
        if target < arr[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}

func binarySearchLowerBounds(_ arr: [Int], _ target: Int) -> Int {
    var low = 0
        var high = arr.count
        var mid = 0
        
    while low < high {
        mid = (low + high)/2
        if target <= arr[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    return low
}

func binarySearchBounds(_ arr: [Int], _ target: Int, upper: Bool = false) -> Int {
    var low = 0
    var high = arr.count
    var mid = 0
    
    while low < high {
        mid = (low + high)/2
        if target == arr[mid] {
            upper ? (low = mid+1) : (high = mid)
        } else if target < arr[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    return low
}

var array = [1, 5, 7, 15, 22, 65, 80, 100]
binarySearchBounds(array, 80, upper: true)
binarySearchUpperBounds(array, 80)
binarySearchBounds(array, 80, upper: false)
binarySearchLowerBounds(array, 80)
//binarySearch(arr: array, target: 80)
//binarySearchRecurse(array, 65, from: 0, to: array.count-1)
