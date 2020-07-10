func solution(_ n:Int) -> Int {
    var before = 0
    var fibo = 1
    for _ in 2...n {
        let temp = (before + fibo) % 1234567
        before = fibo
        fibo = temp
    }
    return fibo
}
