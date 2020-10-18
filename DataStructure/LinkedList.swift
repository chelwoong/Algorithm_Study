//
//  LinkedList.swift
//  Testor
//
//  Created by woong on 2020/10/17.
//  Copyright © 2020 woong. All rights reserved.
//

import Foundation

protocol LinkedListing {
    associatedtype T
    associatedtype Node

    var isEmpty: Bool { get }
    var first: Node? { get }
    var last: Node? { get }
    var count: Int { get }
    subscript(index: Int) -> T { get }

    func node(at index: Int) -> Node
    func append(_ value: T)
    func append(_ newNode: Node)
    func insert(_ node: Node, at index: Int)
    func remove(node: Node) -> T
    func remove(at index: Int) -> T
    func removeLast() -> T
    func removeAll()
}

class LinkedList<T>: LinkedListing {
    
    class LinkedListNode<T> {
        var value: T
        var next: Node?
        weak var previous: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    typealias T = T
    typealias Node = LinkedListNode<T>    
    
    private(set) var head: Node?

    var isEmpty: Bool {
        return head == nil
    }

    var first: Node? {
        return head
    }

    var last: Node? {
        var node = head
        while let next = node?.next {
            node = next
        }
        return node
    }

    var count: Int {
        var count = 0
        var node = head
        while let next = node?.next {
            node = next
            count += 1
        }
        return count
    }
    
    subscript(index: Int) -> T {
        let node = self.node(at: index)
        return node.value
    }

    func append(_ value: T) {
        let newNode = Node(value: value)
        append(newNode)
    }
    
    func append(_ newNode: Node) {
        if let lastNode = last {
            newNode.previous = last
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func node(at index: Int) -> Node {
        assert(head != nil, "List is Em보pty")
        assert(index >= 0, "index는 0다 커야합니다.")
        var node = head
        var idx = 0

        while idx != index {
            node = node?.next
            idx += 1
        }
        
        assert(node != nil, "index is out of bounds.")
        return node!
    }

    func insert(_ newNode: Node, at index: Int) {
        let prev = node(at: index)
        let next = prev.next
        
        newNode.previous = prev.next
        prev.next = newNode
        newNode.next = next
        next?.previous = newNode
    }

    func removeAll() {
        head = nil
    }

    func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        prev?.next = next
        next?.previous = prev
        
        node.next = nil
        node.previous = nil
        return node.value
    }

    func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }

    func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return remove(node: node)
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var str = "["
        var node = head
        while let nd = node {
            str += "\(nd.value)"
            node = nd.next
            if node != nil { str += ", " }
        }
        return str + "]"
    }
}
