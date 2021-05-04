import Foundation

func convertToSec(_ time: String) -> Int {
    let parsed = time.components(separatedBy: ":")
    let (h, m, s) = (Int(parsed[0])!, Int(parsed[1])!, Int(parsed[2])!)
    return h*3600 + m*60 + s
}

func convertToTime(_ sec: Int) -> String {
    return String(format: "%02d:%02d:%02d", sec/3600, (sec%3600)/60, sec%60)
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    let advTime = convertToSec(adv_time)
    let playTime = convertToSec(play_time)
    var events: [(time: Int, view: Int)] = [(0, 0)]
    
    logs.forEach { log in
        let p = log.components(separatedBy: "-")
        let (start, end) = (convertToSec(p[0]), convertToSec(p[1]))
        events.append((start, 1))
        events.append((end, -1))
    }
    
    events.sort(by: { $0.time < $1.time})
    
    var viewersAtStart = 0, viewersAtEnd = 0
    var advStartIdx = 0, advEndIdx = 0
    var currentValue = 0, currentTime = 0
    var maxValue = 0, maxTime = 0
    
    // 처음 시청시간 계산
    while advEndIdx+1 < events.count, events[advEndIdx+1].time <= advTime {
        currentValue += (events[advEndIdx+1].time - events[advEndIdx].time) * viewersAtEnd
        viewersAtEnd += events[advEndIdx+1].view
        advEndIdx += 1
    }
    
    currentValue += (advTime - events[advEndIdx].time) * viewersAtEnd
    maxValue = currentValue
    
    
    // 이벤트마다 계산
    while currentTime <= playTime-advTime, advEndIdx+1 < events.count {
        let deltaStart = events[advStartIdx+1].time - currentTime
        let deltaEnd = events[advEndIdx+1].time - (currentTime + advTime)
        
        if deltaStart <= deltaEnd {
            // 시작점이 더 가까움
            currentValue += deltaStart * (viewersAtEnd - viewersAtStart)
            viewersAtStart += events[advStartIdx+1].view
            advStartIdx += 1
            currentTime += deltaStart
        } else {
            // 끝점이 더 가까움
            currentValue += deltaEnd * (viewersAtEnd - viewersAtStart)
            viewersAtEnd += events[advEndIdx+1].view
            advEndIdx += 1
            currentTime += deltaEnd
        }
        if currentValue > maxValue {
            maxValue = currentValue
            maxTime = currentTime
        }
    }
    
    
    return convertToTime(maxTime)
}
