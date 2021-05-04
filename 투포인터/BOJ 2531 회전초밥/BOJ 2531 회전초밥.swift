let ndkc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, d, k, c) = (ndkc[0], ndkc[1], ndkc[2], ndkc[3])
var dish = [Int]()
for _ in 0..<n {
    dish.append(Int(readLine()!)!)
}

var menu = [Int](repeating: 0, count: d+1)
var currentSet = Set<Int>()
for i in 0..<k {
    currentSet.insert(dish[i])
    menu[dish[i]] += 1
}

var maxKinds = currentSet.contains(c) ? currentSet.count : currentSet.count+1
for i in k..<dish.count+k {
    let removeDish = dish[i-k]
    menu[removeDish] -= 1
    if menu[removeDish] == 0 {
        currentSet.remove(removeDish)
    }
    
    let addDish = dish[i % dish.count]
    menu[addDish] += 1
    currentSet.insert(addDish)
    
    let kinds = currentSet.contains(c) ? currentSet.count : currentSet.count+1
    maxKinds = max(maxKinds, kinds)
}

print(maxKinds)
