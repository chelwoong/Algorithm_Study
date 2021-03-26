import Foundation

let n = Int(readLine()!)!
let inOrderList = readLine()!.split(separator: " ").map { Int(String($0))! }
var postOrderList = readLine()!.split(separator: " ").map { Int(String($0))! }

var inOrderIndexTable = [Int: Int]()
inOrderList.enumerated().forEach {
  inOrderIndexTable[$0.element] = $0.offset
}

var preOrderListResult = [String]()

func makePreOrder(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int) {
  guard inStart <= inEnd, postStart <= postEnd else { return }
  
  preOrderListResult.append("\(postOrderList[postEnd])")
  let rootIndexOfInOrder = inOrderIndexTable[postOrderList[postEnd]]!
  
  let leftPostCount = (rootIndexOfInOrder - inStart) - 1
  let leftPostEnd = postStart + leftPostCount
  
  // 왼쪽
  makePreOrder(inStart, rootIndexOfInOrder-1, postStart, leftPostEnd)
  // 오른쪽
  makePreOrder(rootIndexOfInOrder+1, inEnd, leftPostEnd+1, postEnd-1)
}

makePreOrder(0, inOrderList.count-1, 0, postOrderList.count-1)
print(preOrderListResult.joined(separator: " "))
