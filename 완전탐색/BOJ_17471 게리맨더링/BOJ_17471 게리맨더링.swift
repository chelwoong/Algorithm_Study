let n = Int(readLine()!)!

var population: [Int] = [0]
var adjacent = [[Int]](repeating: [Int](), count: n+1)
var party = [Int](repeating: 0, count: n+1)
var minDifference = 10000

for p in readLine()!.split(separator: " ").map({ Int(String($0))! }) {
    population.append(p)
}

for i in 1...n {
    let adj = [Int](readLine()!.split(separator: " ").map({ Int(String($0))! }).dropFirst())
    adjacent[i] = adj
}

func checkPopulation() {
    var checked = [Bool](repeating: false, count: n+1)
    checked[0] = true
    
    var partySum = [0, 0]
    
    func checkParty(_ idx: Int) {
        partySum[party[idx]] += population[idx]
        
        for adj in adjacent[idx] where party[adj] == party[idx] {
            guard !checked[adj] else { continue }
            checked[adj] = true
            checkParty(adj)
        }
    }
    
    checked[1] = true
    checkParty(1)
    
    var nextParty = 2
    while nextParty <= n {
        guard !checked[nextParty] else { nextParty += 1; continue }
        checked[nextParty] = true
        checkParty(nextParty)
        break
    }
    
    let diff = abs(partySum[0] - partySum[1])
    if minDifference > diff, !checked.contains(false) {
        minDifference = diff
    }
}


func setParty(_ idx: Int) {
    guard idx != n else { checkPopulation(); return }
    party[idx] = 1
    setParty(idx+1)
    party[idx] = 0
    setParty(idx+1)
}

setParty(0)
print(minDifference == 10000 ? -1 : minDifference)
