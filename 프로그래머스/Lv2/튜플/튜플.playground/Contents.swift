import Foundation

func solution(_ s:String) -> [Int] {
    // 파싱
    let str = (s.dropFirst(2)).dropLast(2)

    var parsed = str.components(separatedBy: "},{").map{
        $0.components(separatedBy: ",")
    }
    parsed.sort(by: { $0.count < $1.count })

    var originTuple = [Int]()
    var tupleSet = Set<String>()
    for elements in parsed {
        for element in elements {
            if !tupleSet.contains(element) {
                originTuple.append(Int(element)!)
                tupleSet.insert(element)
            }
        }
    }
    return originTuple
}
