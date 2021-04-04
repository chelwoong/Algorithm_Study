
let n = Int(readLine()!)!
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var a = [Int]()
var b = [Int]()
for _ in 0..<nm[0] {
  a.append(Int(readLine()!)!)
}

for _ in 0..<nm[1] {
  b.append(Int(readLine()!)!)
}

func sum(_ arr: [Int]) -> [Int: Int] {
  var table = [0: 1]
  for i in 0..<arr.count {
    var temp = 0
    for j in i..<i+arr.count-1 {
      temp += arr[j % arr.count]
      table[temp, default: 0] += 1
    }
  }
  table[arr.reduce(0, +), default: 0] += 1
  return table
}

let aTable = sum(a)
let bTable = sum(b)

let sumA = [Int](aTable.keys).sorted()
let sumB = [Int](bTable.keys).sorted()

var resultCase = 0

for an in sumA where an <= n  {
  guard an != n else {
    resultCase += aTable[an]!
    break
  }
  
  if let bn = binarySearch(n-an) {
    resultCase += aTable[an]! * bTable[bn]!
  }
}

func binarySearch(_ target: Int) -> Int? {
  var low = 0
  var high = sumB.count-1
  
  while low <= high {
    let mid = (low + high) / 2
    
    if sumB[mid] == target {
      return sumB[mid]
    } else if target < sumB[mid] {
      high = mid-1
    } else {
      low = mid+1
    }
  }
  
  return nil
}

print(resultCase)
