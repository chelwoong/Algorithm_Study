
typealias Point = (r: Int, c: Int)

func isPastable(_ sticker: [[Int]], to point: Point) -> Bool {
    for r in 0..<sticker.count {
        for c in 0..<sticker[0].count {
            let pr = point.r + r
            let pc = point.c + c
            guard pr < notebook.count, pc < notebook[0].count else { return false }
            guard sticker[r][c] == 1 else { continue }
            guard notebook[pr][pc] else { return false }
        }
    }
    return true
}

func paste(_ sticker: [[Int]], to point: Point) {
    for r in 0..<sticker.count {
        for c in 0..<sticker[0].count {
            guard sticker[r][c] == 1 else { continue }
            notebook[point.r + r][point.c + c] = false
            pasteCount += 1
        }
    }
}

func rotate(_ sticker: [[Int]]) -> [[Int]] {
    let rowSize = sticker.count
    let colSize = sticker[0].count
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: rowSize), count: colSize)
    
    for r in 0..<rowSize {
        for c in 0..<colSize {
            rotated[c][rowSize-r-1] = sticker[r][c]
        }
    }
    return rotated
}

func tryPaste(_ sticker: [[Int]]) -> Bool {
    for r in 0..<nmk[0] {
        for c in 0..<nmk[1] {
            guard isPastable(sticker, to: (r, c)) else { continue }
            paste(sticker, to: (r, c))
            return true
        }
    }
    return false
}


var nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
var notebook = [[Bool]](repeating: [Bool](repeating: true, count: nmk[1]), count: nmk[0])
var pasteCount = 0

for _ in 0..<nmk[2] {
    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
    var sticker = [[Int]]()
    for _ in 0..<rc[0] {
        sticker.append(readLine()!.split(separator: " ").map({ Int(String($0))! }))
    }
    
    for _ in 0..<4 {
        guard tryPaste(sticker) else {
            sticker = rotate(sticker)
            continue
        }
        break
    }
}

print(pasteCount)
