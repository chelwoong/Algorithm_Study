//
//  main.swift
//  BOJ2352_반도체 설계
//
//  Created by woong on 2020/06/11.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!
let port = readLine()!.components(separatedBy: " ").map{Int($0)!}
var connects = [Bool](repeating: false, count: n+1)
connects[0] = true


var minIndex = Int.max
var i = 0
var minPort = 0
var tempCount = 0
var result = 0

while connects.contains(false) {
    i += 1
    if i > n {
        i = connects.firstIndex(of: false)!
        minPort = 0
        tempCount = 0
    }
    guard !connects[i] else { continue }
    
    if port[i-1] > minPort {
        minIndex = min(minIndex, i)
        connects[i] = true
        minPort = port[i-1]
        tempCount += 1
        result = max(result, tempCount)
    }
}

print(result)
