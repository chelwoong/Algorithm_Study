//
//  main.swift
//  BOJ1049_기타줄
//
//  Created by woong on 2020/06/08.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation


let n = readLine()!.split(separator: " ").map{Int($0)!}

var minPackage = Int.max
var minPiece = Int.max
for _ in 0..<n[1] {
    let inputs = readLine()!.split(separator: " ").map{Int($0)!}
    minPackage = min(minPackage, inputs[0])
    minPiece = min(minPiece, inputs[1])
}

if minPackage > minPiece * 6 {
    print(n[0] * minPiece)
} else {
    var total = 0
    let packageCount = n[0] / 6
    let pieceCount = n[0] % 6
    
    total += packageCount * minPackage
    
    if pieceCount * minPiece > minPackage {
        total += minPackage
    } else {
        total += pieceCount * minPiece
    }
    
    // n[0]/6 * minPackage + min(minPackage, pieceCount * minPiece)
    print(total)
}

