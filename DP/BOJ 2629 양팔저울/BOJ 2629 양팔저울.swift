let n = Int(readLine()!)!
var scales = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
var marbles = readLine()!.split(separator: " ").map { Int(String($0))! }
var check = [[Bool]](repeating: [Bool](repeating: false, count: 15005), count: scales.count+1)

func addScale(_ idx: Int, _ weight: Int) {
    
    guard !check[idx][weight] else { return }
    check[idx][weight] = true
    
    guard idx < scales.count else { return }
        
    addScale(idx+1, weight + scales[idx])
    addScale(idx+1, weight)
    addScale(idx+1, abs(weight - scales[idx]))
}

addScale(0, 0)
print(marbles.map({ ($0 > 1500 || !check[scales.count][$0]) ? "N" : "Y" }).joined(separator: " "))
