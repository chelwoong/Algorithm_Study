import Foundation

var nmh = readLine()!.split(separator: " ").map { Int(String($0))! }

var ladders = [[Bool]](repeating: [Bool](repeating: false, count: nmh[0]), count: nmh[2])

for _ in 0..<nmh[1] {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    ladders[ab[0]-1][ab[1]-1] = true
}

func arrive(at start: Int) -> Int {
    var c = start
    for r in 0..<nmh[2] {
        if c > 0, ladders[r][c-1] {
            c -= 1
        } else if ladders[r][c] {
            c += 1
        }
    }
    return c
}

func isExpected() -> Bool {
    for i in 0..<nmh[0] {
        guard i == arrive(at: i) else { return false }
    }
    return true
}

func install(_ row: Int, _ added: Int) {
    if added == shouldAdd {
        if isExpected() {
            print(added)
            exit(0)
        }
    } else {
        for r in row..<ladders.count {
            for c in 0..<ladders[0].count-1 {
                guard !ladders[r][c], !ladders[r][c+1] else { continue }
                if c > 0, ladders[r][c-1] {
                    continue
                }
                ladders[r][c] = true
                install(r, added+1)
                ladders[r][c] = false
            }
        }
    }
}

var shouldAdd = 0
for i in 0...3 {
    shouldAdd = i
    install(0, 0)
}

print(-1)
