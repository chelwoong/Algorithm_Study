//
//  PriorityQueue.swift
//  Testor
//
//  Created by woong on 2020/10/18.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

struct PriorityQueue<T> {
    var heap: Heap<T>
    
    init(sort: @escaping (T, T) -> Bool) {
        heap = Heap<T>(sort: sort)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    func peek() -> T? {
        return heap.peek()
    }
    
    mutating func enqueue(element: T) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    mutating func changePriority(index i: Int, value: T) {
        heap.replace(index: i, value: value)
    }
}

extension PriorityQueue where T: Equatable {
    func index(of element: T) -> Int? {
        return heap.index(of: element)
    }
}
