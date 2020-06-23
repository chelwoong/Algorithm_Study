let n = readLine()!.split(separator: " ").map{Int($0)!}
var numStr = readLine()!

var k = n[1]
var cuttedNumber = [Character]()

for originChar in numStr {
  if k == 0 {
    cuttedNumber.append(originChar)
    continue
  }
  
  if cuttedNumber.isEmpty {
    cuttedNumber.append(originChar)
    continue
  }
  
  var idx = cuttedNumber.count-1
  while idx >= 0 {
    if cuttedNumber[idx] >= originChar {
      // 비교대상보다 작거나 같으면 그냥 뒤에 추가
      cuttedNumber.append(originChar)
      break
    } else {
      // 더 크다면 마지막을 잘라냄
      cuttedNumber.removeLast()
      k -= 1
      idx -= 1
      if idx == -1 || k == 0 {
        cuttedNumber.append(originChar)
        break
      }
    }
  }
}

cuttedNumber.enumerated().forEach{ if $0.offset < (n[0]-n[1]) {print($0.element, terminator: "")} }
