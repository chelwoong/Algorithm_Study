
import Foundation

func getPrimes(_ n: Int) -> [Int] {
    guard n >= 2 else { return [] }
    var isPrimes = [Bool](repeating: true, count: n+1)
    for i in 2...n {
        guard i*i <= n else { break }
        guard isPrimes[i] else { continue }

        for j in stride(from: i*i, to: n+1, by: i) {
            if isPrimes[j] {
                isPrimes[j] = false
            }
        }
    }

    var primes = [Int]()
    for prime in 2...n where isPrimes[prime] {
        primes.append(prime)
    }

    return primes
}

let n = Int(readLine()!)!
let primes = getPrimes(n)
var start = 0
var end = 0
var sum = 0
var numberOfCase = 0

while end <= primes.count {
    if sum >= n {
        if sum == n {
            numberOfCase += 1
        }
        sum -= primes[start]
        start += 1
    } else {
        guard end < primes.count else { break }
        sum += primes[end]
        end += 1
    }
}

print(numberOfCase)
