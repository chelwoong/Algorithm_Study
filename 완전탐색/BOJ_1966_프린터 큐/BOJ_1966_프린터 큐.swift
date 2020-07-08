for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    var importanceCountTable = [Int](repeating: 0, count: 10)
    let printerImportance = readLine()!.split(separator: " ").map{Int($0)!}
    printerImportance.forEach { importanceCountTable[$0] += 1 }
    var currentImportance = printerImportance.max()!
    
    var printer = Array<Int>(0..<nm[0])
    var cursor = 0
    var printedCount = 1
    while true {
        let currIndex = printer[cursor]
        if printerImportance[currIndex] < currentImportance {
            printer.append(currIndex)
        } else {
            if nm[1] == currIndex {
                print(printedCount)
                break
            }
            importanceCountTable[currentImportance] -= 1
            while importanceCountTable[currentImportance] == 0 || currentImportance == 0 {
                currentImportance -= 1
            }
            printedCount += 1
        }
        
        cursor += 1
    }
}
