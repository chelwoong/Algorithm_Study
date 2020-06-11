import UIKit

/*
 Permutation 순열 구하기
 */


//var data = [1, 2, 3]
//var data = ["a", "b", "c"]
func processTime(blockFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    blockFunction()
    let processTime = CFAbsoluteTimeGetCurrent() - startTime
    print("걸린 시간 = \(processTime)")
}

var data = Array<Int>(0...3)

//func perm(_ k: Int) {
//    print("in perm: \(k)")
//    if k == data.count {
//        print(data)
//        return
//    }
//
//    for i in k..<data.count {
//        data.swapAt(k, i)
//        print("swap(\(k), \(i)) --> data: \(data)")
//        perm(k+1)
//        data.swapAt(k, i)
//        print("return swap(\(k), \(i)) --> data: \(data)")
//    }
//}
//processTime {
//    perm(0)
//}


func perm(start s: Int, end e: Int) {
    if s == e {
        print(data[0..<e])
    }
    
    for i in s..<e {
        data.swapAt(s, i)
        perm(start: s+1, end: e)
        data.swapAt(s, i)
    }
}

perm(start: 0, end: data.count)



