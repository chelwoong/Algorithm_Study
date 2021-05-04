import Foundation

class Node {
    let name: String
    var amount = 0
    var referral: Node?
    
    init(_ name: String) {
        self.name = name
    }
    
    func add(_ amount: Int) {
        guard amount > 1 else { self.amount += amount; return }
        self.amount += amount - amount/10
        referral?.add(amount/10)
    }
}

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var tree = [String: Node]()
    
    enroll.forEach { tree[$0] = Node($0) }
    for i in 0..<enroll.count {
        guard referral[i] != "-" else { continue }
        tree[enroll[i]]!.referral = tree[referral[i]]!
    }
    
    for i in 0..<seller.count {
        tree[seller[i]]!.add(amount[i] * 100)
    }
    
    return enroll.map { tree[$0]!.amount }
}
