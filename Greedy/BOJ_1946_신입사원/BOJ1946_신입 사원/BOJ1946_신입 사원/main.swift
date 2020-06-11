//
//  main.swift
//  BOJ1946_신입 사원
//
//  Created by woong on 2020/06/08.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

//// 시간초과
//for _ in 0..<Int(readLine()!)! {
//    var pass = 0
//    var candidators = [[Int]]()
//    for _ in 0..<Int(readLine()!)! {
//        let scores = readLine()!.split(separator: " ").map { Int($0)! }
//        candidators.append(scores)
//    }
//
//    candidators.sort { (c1, c2) -> Bool in
//        return c1[0] < c2[0]
//    }
//
//    while !candidators.isEmpty {
//        pass += 1
//        let passCandi = candidators[0]
//        var newCandi = [[Int]]()
//
//        for i in 1..<candidators.count {
//            if passCandi[1] > candidators[i][1] {
//                newCandi.append(candidators[i])
//            }
//        }
//        candidators = newCandi
//    }
//    print(pass)
//}


for _ in 0..<Int(readLine()!)! {
    var pass = 1
    var candidators = [[Int]]()
    for _ in 0..<Int(readLine()!)! {
        let scores = readLine()!.split(separator: " ").map { Int($0)! }
        candidators.append(scores)
    }
    
    candidators.sort { (c1, c2) -> Bool in
        return c1[0] < c2[0]
    }
    
    var min = candidators[0][1]
    
    for i in 1..<candidators.count {
        if min > candidators[i][1] {
            min = candidators[i][1]
            pass += 1
        }
    }
    
    print(pass)
}
