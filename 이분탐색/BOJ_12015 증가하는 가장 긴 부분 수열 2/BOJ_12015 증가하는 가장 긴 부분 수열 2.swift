let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var lis = [arr[0]]

for num in arr.dropFirst() {
    if num > lis.last! {
        lis.append(num)
    } else {
        var low = 0
        var high = lis.count
        
        while low < high {
            let mid = (low + high)/2
            if num <= lis[mid] {
                high = mid
            } else {
                low = mid + 1
            }
        }
        
        lis[low] = num
    }
}

print(lis.count)
