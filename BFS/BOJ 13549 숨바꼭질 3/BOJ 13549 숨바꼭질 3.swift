public struct Deque<T> {
  private var array: [T?]
  private var head: Int
  private var capacity: Int
  private let originalCapacity: Int

  public init(_ capacity: Int = 10) {
    self.capacity = max(capacity, 1)
    originalCapacity = self.capacity
    array = [T?](repeating: nil, count: capacity)
    head = capacity
  }

  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func enqueueFront(_ element: T) {
    if head == 0 {
      capacity *= 2
      let emptySpace = [T?](repeating: nil, count: capacity)
      array.insert(contentsOf: emptySpace, at: 0)
      head = capacity
    }

    head -= 1
    array[head] = element
  }

  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    if capacity >= originalCapacity && head >= capacity*2 {
      let amountToRemove = capacity + capacity/2
      array.removeFirst(amountToRemove)
      head -= amountToRemove
      capacity /= 2
    }
    return element
  }

  public mutating func dequeueBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeLast()
    }
  }

  public func peekFront() -> T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }

  public func peekBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.last!
    }
  }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }

var values = [Int](repeating: 100000, count: 100001)
values[nk[0]] = 0
var visit = [Bool](repeating: false, count: 100001)
var deque = Deque<Int>()
deque.enqueue(nk[0])

while !deque.isEmpty {
    let curr = deque.dequeue()!

    guard curr != nk[1] else {
        print(values[nk[1]]); break
    }

    if curr * 2 <= 100000, !visit[curr*2] {
        deque.enqueueFront(curr*2)
        values[curr*2] = values[curr]
        visit[curr*2] = true
    }
    if curr+1 <= 100000, !visit[curr+1] {
        deque.enqueue(curr+1)
        values[curr+1] = values[curr]+1
        visit[curr+1] = true
    }
    if curr-1 >= 0, !visit[curr-1] {
        deque.enqueue(curr-1)
        values[curr-1] = values[curr]+1
        visit[curr-1] = true
    }
}
