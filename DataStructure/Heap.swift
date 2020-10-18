//
//  Heap.swift
//  Testor
//
//  Created by woong on 2020/10/18.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

/*
 peek: O(1)
 insert/delete: O(logN)
 */
protocol Heapable {
    associatedtype T
    
    var isEmpty: Bool { get }
    var count: Int { get }
    func peek() -> T?
    mutating func insert(_ value: T)
    mutating func remove() -> T?
    mutating func remove(at index: Int) -> T?
}

struct Heap<T>: Heapable {
    
    typealias T = T
    var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func replace(index i: Int, value: T) {
        guard 0..<nodes.count ~= i else { return }
        
        remove(at: i)
        insert(value)
    }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count-1)
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    @discardableResult
    mutating func remove(at index: Int) -> T? {
        guard 0..<nodes.count ~= index else { return nil }
        
        let end = nodes.count-1
        if index != end {
            nodes.swapAt(index, end)
            shiftDown(index)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    // MARK: Private
    
    private func parentIndex(of index: Int) -> Int {
        return (index-1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return index*2 + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return index*2 + 2
    }
    
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(of: index)
        
        while childIndex > 0, orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(of: index)
        let rightChildIndex = self.rightChildIndex(of: index)
        
        var first = index
        if leftChildIndex < endIndex, orderCriteria(nodes[first], nodes[leftChildIndex]) {
            first = leftChildIndex
        }
        
        if rightChildIndex < endIndex, orderCriteria(nodes[first], nodes[rightChildIndex]) {
            first = rightChildIndex
        }
        
        guard first != index else { return }
        nodes.swapAt(first, index)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.endIndex)
    }
}

// MARK: - Searching

extension Heap where T: Equatable {
    
    func index(of node: T) -> Int? {
        return nodes.firstIndex(of: node)
    }
    
    @discardableResult
    mutating func remove(node: T) -> T? {
        guard let index = nodes.firstIndex(of: node) else { return nil }
        return nodes.remove(at: index)
    }
}
