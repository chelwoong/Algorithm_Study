class Node {
    var nextTasks = [Int]()
    var inDegree = 0
    var workingTime = 0
    var endTime = 0
    
    func finishTask(at time: Int) {
        inDegree -= 1
        endTime = max(endTime, time + workingTime)
    }
}

let n = Int(readLine()!)!
var tasks = (0..<n).map { _ in Node() }
for idx in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (workingTime, inDegree ,inDegrees) = (input[0], input[1], [Int](input.dropFirst(2)))
    tasks[idx].workingTime = workingTime
    tasks[idx].endTime = workingTime
    tasks[idx].inDegree = inDegree
    
    inDegrees.forEach {
        tasks[$0-1].nextTasks.append(idx)
    }
}

var inDegreeZero = [Int]()
for idx in 0..<tasks.count {
    guard tasks[idx].inDegree == 0 else { continue }
    inDegreeZero.append(idx)
}

var lastEndTime = 0
while !inDegreeZero.isEmpty {
    let finish = inDegreeZero.removeFirst()
    let endTime = tasks[finish].endTime
    if endTime > lastEndTime {
        lastEndTime = endTime
    }
    tasks[finish].nextTasks.forEach {
        tasks[$0].finishTask(at: endTime)
        if tasks[$0].inDegree == 0 {
            inDegreeZero.append($0)
        }
    }
}

print(lastEndTime)
