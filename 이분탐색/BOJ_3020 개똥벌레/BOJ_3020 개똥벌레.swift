let nh = readLine()!.split(separator: " ").map { Int(String($0))! }
var stal = [Int]()
var opStal = [Int]()

for i in 0..<nh[0] {
  if i % 2 == 0 {
    stal.append(Int(readLine()!)!)
  } else {
    opStal.append(Int(readLine()!)!)
  }
}

stal.sort()
opStal.sort()

func binary(_ array: [Int], target: Int, isUpper: Bool) -> Int {
  var low = 0
  var high = array.count
  
  while low < high {
    let mid = (low + high)/2
    if target == array[mid] {
      isUpper ? (low = mid+1) : (high = mid)
    } else if target < array[mid] {
      high = mid
    } else {
      low = mid+1
    }
  }
  return low
}

var minTable = [Int: Int]()
var minKey = 555555

for height in 1...nh[1] {
  var count = stal.count - binary(stal, target: height, isUpper: false)
  count += opStal.count - binary(opStal, target: nh[1] - height, isUpper: true)
  
  if minTable.keys.contains(count) {
    minTable[count]! += 1
  } else {
    minTable[count] = 1
    if count < minKey {
      minKey = count
    }
  }
}

print(minKey, minTable[minKey]!)
