import Foundation

// 이전 형태가 그대로 내려오고
// + 0
// 이전 형태랑 반대


func completeArray(array: [Int]) -> [Int] {
  return array.map { $0 == 0 ? 1 : 0 }
}

func solution(_ n:Int) -> [Int] {
  
  var paperArray = [0]
  if n == 1 {
    return paperArray
  }
  
  for _ in 2...n {
    let completedPaperArray = completeArray(array: paperArray)
    paperArray.append(0)
    paperArray.append(contentsOf: completedPaperArray.reversed())
  }
  
  return paperArray
}
