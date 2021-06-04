
let maxRange = 1000
var used = [[Bool]](repeating: [Bool](repeating: false, count: maxRange+5), count: maxRange+5)
var desiredEmojiNumber = Int(readLine()!)!

func makeEmoji() {
    var queue = [(emoji: Int, clipBoard: Int, time: Int)]()
    queue.append((1, 0, 0))
    used[1][0] = true
    while !queue.isEmpty {
        let (emoji, clipBoard, time) = queue.removeFirst()
        if emoji == desiredEmojiNumber {
            print(time)
            return
        }
        
        // 덮어쓰기
        if emoji <= maxRange, !used[emoji][emoji] {
            queue.append((emoji, emoji, time+1))
            used[emoji][emoji] = true
        }
        
        
        // 붙여넣기
        if emoji+clipBoard <= maxRange, !used[emoji+clipBoard][clipBoard] {
            queue.append((emoji+clipBoard, clipBoard, time+1))
            used[emoji+clipBoard][clipBoard] = true
        }
        
        // 삭제
        if emoji-1 >= 0, !used[emoji-1][clipBoard] {
            queue.append((emoji-1, clipBoard, time+1))
            used[emoji-1][clipBoard] = true
        }
    }
}

makeEmoji()
