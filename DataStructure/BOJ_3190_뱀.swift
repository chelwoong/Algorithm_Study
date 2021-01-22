//
//  main.swift
//  Workspace
//
//  Created by woong on 2020/11/16.
//

// import Foundation

// 3190

enum Cmd: String {
    case L = "L"
    case D = "D"
}

enum Direction {
    case up
    case down
    case left
    case right
    
    func rotate(order: Cmd) -> Direction {
        switch self {
            case .up: return order == .L ? .left : .right
            case .down: return order == .L ? .right : .left
            case .left: return order == .L ? .down : .up
            case .right: return order == .L ? .up : .down
        }
    }
    
    func next(from curr: Point) -> Point {
        switch self {
            case .up: return Point(curr.r-1, curr.c)
            case .down: return Point(curr.r+1, curr.c)
            case .left: return Point(curr.r, curr.c-1)
            case .right: return Point(curr.r, curr.c+1)
        }
    }
}

class Point: Hashable, CustomStringConvertible {
    var r: Int
    var c: Int
    var next: Point?
    weak var previous: Point?
    
    init(_ r: Int, _ c: Int) {
        self.r = r
        self.c = c
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.r == rhs.r && lhs.c == rhs.c
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(r)
        hasher.combine(c)
    }
    
    var description: String {
        return "(\(r),\(c))"
    }
}

class Snake {
    var head: Point
    var tail: Point
    private(set) var body: Set<Point>
    
    init(_ point: Point) {
        head = point
        tail = point
        body = Set<Point>(arrayLiteral: point)
    }
    
    func move(to next: Point, findApple: Bool) {
        body.insert(next)
        head.next = next
        next.previous = head
        head = next
        
        if !findApple {
            body.remove(tail)
            tail = tail.next!
            tail.previous?.next = nil
            tail.previous = nil
        }
    }
}

typealias Order = (duetime: Int, command: Cmd)

var n = Int(readLine()!)!

var k = Int(readLine()!)!
var applePoints = Set<Point>((0..<k).map({ _ -> Point in
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return Point(input[0]-1, input[1]-1)
}))

var l = Int(readLine()!)!
var orders: [Order] = (0..<l).map { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    return Order(Int(input[0])!, Cmd(rawValue: input[1])!)
}.reversed()

func isInRange(_ curr: Point) -> Bool {
    return 0..<n ~= curr.r && 0..<n ~= curr.c
}

func solution() {
    var runningTime = 0
    let snake = Snake(Point(0, 0))
    var dir = Direction.right
    var order = orders.popLast()

    while true {
        runningTime += 1
        let next = dir.next(from: snake.head)
        guard isInRange(next), !snake.body.contains(next) else { break }
        snake.move(to: next, findApple: applePoints.contains(next))
        applePoints.remove(next)
        
        while let currentOrder = order, currentOrder.duetime == runningTime {
            dir = dir.rotate(order: currentOrder.command)
            order = orders.popLast()
        }
    }
    print(runningTime)
}

solution()
