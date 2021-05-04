// MARK: - 광고삽입

import Foundation

func convertTimeToInt(from time: String) -> Int {
    let hms = time.split(separator: ":").map { Int(String($0))! }
    return hms[0] * 3600 + hms[1] * 60 + hms[2]
}

func convertTimeToString(from time: Int) -> String {
    var stringTime = time / 3600 >= 10 ? "\(time/3600):" : "0\(time/3600):"
    stringTime += ((time%3600) / 60) >= 10 ? "\((time%3600) / 60):" : "0\((time%3600) / 60):"
    stringTime += ((time%3600) % 60) >= 10 ? "\((time%3600) % 60)" : "0\((time%3600) % 60)"
    return stringTime
}

func convertLog(_ strLog: String) -> (Int, Int) {
    let se = strLog.split(separator: "-").map { convertTimeToInt(from: String($0)) }
    return (se[0], se[1])
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {

    var accLogs = [Int](repeating: 0, count: 360000)

    logs.map({ convertLog($0) }).forEach { (start, end) in
        accLogs[start] += 1
        accLogs[end] -= 1
    }

    for idx in 1..<accLogs.count-1 {
        accLogs[idx] += accLogs[idx-1]
    }

    let advTime = convertTimeToInt(from: adv_time)
    var accTime = accLogs[0..<advTime].reduce(0, +)
    var bestAcc = accTime
    var bestTime = 0

    for idx in 1..<360000-advTime {
        let acc = accTime - accLogs[idx-1] + accLogs[idx+advTime-1]

        if acc > bestAcc {
            bestAcc = acc
            bestTime = idx
        }
        accTime = acc
    }

    return convertTimeToString(from: bestTime)
}
