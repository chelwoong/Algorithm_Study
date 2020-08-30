func combinationColumn(relation: [[String]], sholudSelect: Int, current index: Int, selected: [Int], combiList: inout [[Int]]) {
    
    if sholudSelect == 0 {
        combiList.append(selected)
    } else if index == relation[0].count {
        return
    } else {
        var newSelected = selected
        newSelected.append(index)
        combinationColumn(relation: relation, sholudSelect: sholudSelect, current: index+1, selected: selected, combiList: &combiList)
        combinationColumn(relation: relation, sholudSelect: sholudSelect-1, current: index+1, selected: newSelected, combiList: &combiList)
    }
}


func numberOfRowsSet(of columns: [Int], in relation: [[String]]) -> Int {
    var rows = [String](repeating: "", count: relation.count)
    for col in columns {
        for (idx, row) in relation.enumerated() {
            rows[idx] += row[col]
        }
    }
    return Set(rows).count
}

func isUnique(combination com: [Int], keys: Set<[Int]>) -> Bool {
    for key in keys {
        var unique = false
        for k in key {
            if !com.contains(k) {
                unique = true
                break
            }
        }
        if !unique {
            return false
        }
    }
    return true
}

func solution(_ relation:[[String]]) -> Int {
    var keys = Set<[Int]>()
    let rowCount = relation.count
    let colCount = relation[0].count
    var combiList = [[Int]]()
    
    for keyCount in 1...colCount {
         combinationColumn(relation: relation, sholudSelect: keyCount, current: 0, selected: [], combiList: &combiList)
    }
    combiList.sort(by: { $0.count < $1.count })
    
    // print(combiList)
    for combi in combiList {
        // 작은것부터 하니까 keys가 combi에 전부 포함되어 있는지만 보면 됨
        guard isUnique(combination: combi, keys: keys) else { continue }
        if numberOfRowsSet(of: combi, in: relation) == rowCount {
            keys.insert(combi)
            // print(keys)
        }
    }
    
    // print(keys)
    return keys.count
}
