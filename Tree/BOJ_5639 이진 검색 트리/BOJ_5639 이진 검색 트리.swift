
import Foundation

var preOrderList = [Int]()
while let s = readLine(), let n = Int(s) {
  preOrderList.append(n)
}

func binaryUpperBounds(start: Int, end: Int, target compare: Int) -> Int {
  var start = start
  var end = end

  while start < end {
    let mid = (start + end)/2

    if compare < preOrderList[mid] {
      end = mid
    } else {
      start = mid+1
    }
  }
  return start
}

func postOrder(start: Int, end: Int) {
  guard start < end else { return }

  let upperIndex = binaryUpperBounds(start: start+1, end: end, target: preOrderList[start])
  postOrder(start: start+1, end: upperIndex)
  postOrder(start: upperIndex, end: end)
  print(preOrderList[start])
}

postOrder(start: 0, end: preOrderList.count)
