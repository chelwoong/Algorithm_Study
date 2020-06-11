//
//  main.swift
//  BOJ1080_행렬
//
//  Created by woong on 2020/06/11.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
var changableBoard = [[Int]](repeating: [], count: input[0])
var targetBoard = [[Int]](repeating: [], count: input[0])
var count = 0

for i in 0..<input[0] * 2 {
    let row = readLine()!
    if i < input[0] {
        for c in row {
            changableBoard[i].append(Int(String(c))!)
        }
    } else {
        for c in row {
            targetBoard[i-input[0]].append(Int(String(c))!)
        }
    }
}

func reverseBoard(_ board: inout [[Int]], _ row: Int, _ col: Int) {
    for r in row..<row+3 {
        for c in col..<col+3 {
            board[r][c] = board[r][c] == 0 ? 1 : 0
        }
    }
}

func changeBoard() {
    if input[0] < 3 || input[1] < 3 { return }
    
    for r in 0..<input[0]-2 {
        for c in 0..<input[1]-2 {
            if changableBoard[r][c] != targetBoard[r][c] {
                reverseBoard(&changableBoard, r, c)
                count += 1
            }
            
            if c == input[1]-3 {
                for i in input[1]-3..<input[1] {
                    // 현재 행에서 최대한으로 바꿨는데도 바꾸지 못하는 열이 남아있다면 바꿀 수 없음
                    if changableBoard[r][i] != targetBoard[r][i] { return }
                }
            }
        }
    }
    
}

func main() {
    changeBoard()
    if changableBoard == targetBoard {
        print(count)
    } else {
        print(-1)
    }
}

main()
