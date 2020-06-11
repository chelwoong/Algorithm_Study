import UIKit

/**
 * Input
 * 5
 * 2 6 8 9 10
 * 2 4
 *
 * Ouput
 * 23
 */


let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int($0)!}
let range = readLine()!.split(separator: " ").map{Int($0)!}

var sum = 0
for i in range[0]-1..<range[1]-1 {
    sum += arr[i]
}

while let test = readLine() {
    <#code#>
}
