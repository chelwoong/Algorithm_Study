import Foundation

func solution(_ gems:[String]) -> [Int] {
    let gemCount = Set<String>(gems).count
    var gemDictionary = [String: Int]()
    
    var start = 0
    var end = 0
    
    var currentGemSet = Set<String>()
    currentGemSet.insert(gems[0])
    gemDictionary[gems[0]] = 1
    var result = [1, 100000]
    
    while start < gems.count {
        if currentGemSet.count == gemCount {
            if result[1] - result[0] > end - start {
                result = [start+1, end+1]
            }
        }
        
        if end < gems.count-1 {
            end += 1
            gemDictionary[gems[end], default: 0] += 1
            currentGemSet.insert(gems[end])
        } else {
            gemDictionary[gems[start]]! -= 1
            if gemDictionary[gems[start]] == 0 {
                currentGemSet.remove(gems[start])
            }
            start += 1
        }
        
        
        
        while start < gems.count, let count = gemDictionary[gems[start]], count > 1 {
            gemDictionary[gems[start]]! -= 1
            if gemDictionary[gems[start]]! == 0 {
                currentGemSet.remove(gems[start])
            }
            start += 1
        }
    }
    
    return result
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))
