//
//  main.swift
//  BOJ_게임 개발
//
//  Created by woong on 2020/06/06.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

struct Node {
    var weight: Int
    var childs: [Int]
    
    mutating func push(_ child: Int) {
        self.childs.append(child)
    }
}

let n = Int(readLine()!)!
var inDegrees = [Int](repeating: 0, count: n)
var tree = [Node](repeating: .init(weight: 0, childs: []), count: n)
var costs = [Int](repeating: 0, count: n)
var q = [Int]()


for current in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    tree[current].weight = input[0]
    
    for i in 1..<input.count-1 {
        let preOrder = input[i]-1
        tree[preOrder].push(current)
        inDegrees[current] += 1
    }
    
    if inDegrees[current] == 0 {
        costs[current] = tree[current].weight
        q.append(current)
    }
}

func topologicalSort() {
    
    for _ in 0..<tree.count {
        let curr = q.removeFirst()
        
        for child in tree[curr].childs {
            costs[child] = max(costs[child], costs[curr] + tree[child].weight)
            inDegrees[child] -= 1
            if inDegrees[child] == 0 {
                q.append(child)
            }
        }
    }

    costs.forEach({print($0)})
}

topologicalSort()
