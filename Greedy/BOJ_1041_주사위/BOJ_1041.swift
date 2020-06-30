
//
//  main.swift
//  CommandTestor
//
//  Created by woong on 2020/06/11.
//  Copyright © 2020 woong. All rights reserved.
//


let n = Int(readLine()!)!
let dice = readLine()!.split(separator: " ").map{Int($0)!}
let oneFaceMin = dice.min()!
var twoFaceMin = Int.max
var threeFaceMin = Int.max

for (face, value) in dice.enumerated() {
  for secondIndex in 0...5 {
    if secondIndex == face || secondIndex == (5-face) {
      continue
    }
    for thirdIndex in 0...5 {
      if thirdIndex == face ||
        thirdIndex == 5-face ||
        secondIndex == thirdIndex ||
        secondIndex == 5-thirdIndex {
        continue
      }
      //print("threeFace: (\(face),\(secondIndex), \(thirdIndex))")
      threeFaceMin = min(value + dice[secondIndex] + dice[thirdIndex], threeFaceMin)
    }
    //print("twoFace: (\(face),\(secondIndex)")
    twoFaceMin = min(value + dice[secondIndex], twoFaceMin)
  }
}

// 나이스 풀이

//var faceMin = [Int]()
//faceMin.append(min(dice[0], dice[5]))
//faceMin.append(min(dice[1], dice[4]))
//faceMin.append(min(dice[2], dice[3]))
//faceMin.sort()
//threeFaceMin = faceMin[0] + faceMin[1] + faceMin[2]
//twoFaceMin = faceMin[0] + faceMin[1]


if n == 1 {
  let diceSum = dice.reduce(0, +)
  print(diceSum - dice.max()!)
} else {
  print(threeFaceMin*4 + twoFaceMin*(n-1)*4 + twoFaceMin*(n-2)*4 + oneFaceMin*(n-1)*(n-2)*4 + oneFaceMin*(n-2)*(n-2))
}


