func gcd(_ a: Int, _ b: Int) -> Int {
    return (a % b == 0) ? b : gcd(b, a%b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    var result = arr[0]
    for idx in 1..<arr.count {
        result = lcm(result, arr[idx])
    }
    return result
}
