//
//  main.swift
//  BOJ2529_부등호
//
//  Created by woong on 2020/06/09.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation


/* 시간초과 */

//let n = Int(readLine()!)!
//let opr = readLine()!.components(separatedBy: " ")
//
//func isPass(_ num: [Int]) -> Bool {
//    for i in 0..<num.count-1 {
//        if opr[i] == "<", num[i] > num[i+1] {
//            return false
//        } else if opr[i] == ">", num[i] < num[i+1] {
//            return false
//        }
//    }
//    return true
//}
//
//var useNumbers = Array<Int>(0...9)
//var passed = [Int]()
//
//func pem(_ k: Int, _ numbers: [Int]) {
//
//    guard numbers.count <= opr.count+1 else { return }
//
//    if numbers.count == opr.count+1 {
//        //print(numbers)
//        if isPass(numbers) {
//            var passNum = ""
//            numbers.forEach { passNum += "\($0)"}
//            passed.append(Int(passNum)!)
//        }
//    }
//
//    for i in k..<useNumbers.count {
//        useNumbers.swapAt(k, i)
//        var newNumbers = numbers
//        newNumbers.append(useNumbers[k])
//        pem(k+1, newNumbers)
//        useNumbers.swapAt(k, i)
//    }
//}
//
//pem(0, [])
//passed.sort(by: <)
//passed.last! < 100 ? print("0\(passed.last!)") : print(passed.last!)
//passed.first! < 100 ? print("0\(passed.first!)") : print(passed.first!)
