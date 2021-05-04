import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let fileIO = FileIO()

let (n, m) = (fileIO.readInt(), fileIO.readInt())
var a = [Int]()
var b = [Int]()

for _ in 0..<n {
    a.append(fileIO.readInt())
}
for _ in 0..<m {
    b.append(fileIO.readInt())
}

var aIdx = 0
var bIdx = 0

var ordered = ""

while aIdx < a.count {
    if bIdx == b.count || a[aIdx] < b[bIdx] {
        ordered += "\(a[aIdx]) "
        aIdx += 1
    } else {
        ordered += "\(b[bIdx]) "
        bIdx += 1
    }
}

while bIdx < b.count {
    ordered += "\(b[bIdx]) "
    bIdx += 1
}

ordered.removeLast()
print(ordered)
