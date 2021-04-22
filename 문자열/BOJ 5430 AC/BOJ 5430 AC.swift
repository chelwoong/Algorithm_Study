for _ in 0..<Int(readLine()!)! {
    let orders = readLine()!
    _ = readLine()
    let numbers = readLine()!.dropFirst().dropLast().split(separator: ",").map { Int(String($0))! }
    var head = 0
    var tail = numbers.endIndex-1

    var isError = false
    var isReverse = false
    for order in orders {
        if order == "D" {
            guard tail > head else { isError = true; break }
            if isReverse {
                tail -= 1
            } else {
                head += 1
            }
        } else {
            isReverse.toggle()
        }
    }

    if isError {
        print("error")
    } else if head == tail {
        print("[]")
    } else if isReverse {
        print("[\(numbers[head..<tail].reversed().map { String($0) }.joined(separator: ","))]")
    } else {
        print("[\(numbers[head..<tail].map { String($0) }.joined(separator: ","))]")
    }
}
