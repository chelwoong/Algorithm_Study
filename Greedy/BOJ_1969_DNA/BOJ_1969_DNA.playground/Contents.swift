let n = readLine()!.split(separator: " ").map {Int($0)!}
var dnas = [[String.Element]]()
for _ in 0..<n[0] {
    dnas.append(Array(readLine()!))
}

var result = ""
var hDistance = 0

for i in 0..<n[1] {
    
    // A C G T
    var check = [0, 0, 0, 0]
    var selected = 0
    for j in 0..<dnas.count {
        switch dnas[j][i] {
        case "A": check[0] += 1
        case "C": check[1] += 1
        case "G": check[2] += 1
        case "T": check[3] += 1
        
        
        default: continue
        }
    }
    
    for (dna, count) in check.enumerated() {
        if check[selected] < count {
            selected = dna
        }
    }
    
    switch selected {
    case 0: result += "A"
    case 1: result += "C"
    case 2: result += "G"
    case 3: result += "T"
    default: continue
    }
    hDistance += dnas.count - check[selected]
}

print(result)
print(hDistance)
