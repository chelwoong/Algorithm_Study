// MARK: - 추석 트래픽

import Foundation

func convertSecond(time: [String]) -> Double {
    let hour = Double(time[0])! * 60.0 * 60.0
    let minute = Double(time[1])! * 60.0
    let tempSec = time[2].split(separator: ".")
    let second = Double(tempSec[0])! + (0.001 * Double(tempSec[1])!)

    return hour + minute + second
}

func solution(_ lines:[String]) -> Int {
    for line in lines {
        let temp = line.split(separator: " ").map{String($0)}
        let day = temp[0].replacingOccurrences(of: "-", with: "")
        let t = temp[1].split(separator: ":").map{String($0)}
        let time = convertSecond(time: t)
        print(time)
    }

    return 0
}
