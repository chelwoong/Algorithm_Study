typealias Parcel = (start: Int, arrival: Int, weight: Int)

let nc = readLine()!.split(separator: " ").map{Int($0)!}
var result = 0
let maxCapacity = nc[1]
var capacity = [Int](repeating: 0, count: nc[0]+1)
var parcels = [Parcel]()
for _ in 0..<Int(readLine()!)! {
    let t = readLine()!.split(separator: " ").map{Int($0)!}
    let parcel = Parcel(start: t[0], arrival: t[1], weight: t[2])
    parcels.append(parcel)
}

parcels.sort { (p1, p2) -> Bool in
    if p1.arrival == p2.arrival {
        return p1.start < p2.start
    } else {
        return p1.arrival < p2.arrival
    }
}

for parcel in parcels {
    var maxWeightInParcel = 0
    for capacityIndex in parcel.start..<parcel.arrival {
        maxWeightInParcel = max(maxWeightInParcel, capacity[capacityIndex])
    }
    // 트럭에 더 실을 수 있는 양
    let remain = min(parcel.weight, maxCapacity - maxWeightInParcel)
    result += remain
    
    for capacityIndex in parcel.start..<parcel.arrival {
        capacity[capacityIndex] += remain
    }
}
print(result)
