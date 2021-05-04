// MARK: - 파일명 정렬

func solution(_ files:[String]) -> [String] {
    var fileList = [File]()
    for file in files {
        fileList.append(File(text: file))
    }
    fileList.sort { (f1, f2) -> Bool in
        if f1.head == f2.head {
            let n1 = Int(f1.number)!
            let n2 = Int(f2.number)!
            if n1 == n2 {
                return false
            } else {
                return n1 < n2
            }
        } else {
            return f1.head < f2.head
        }
    }
    return fileList.map { $0.text }
}

struct File {
    var text: String
    var head: String = ""
    var number: String = ""
    var tail: String = ""

    init(text: String) {
        self.text = text
        self.parseFile(text)
    }

    mutating func parseFile(_ file: String) {
        // 0: head, 1: number, 2: tail
        var current = 0

        for char in file.lowercased() {
            if current == 0 {
                if let _ = Int(String(char)) {
                    number.append(char)
                    current += 1
                } else {
                    head.append(char)
                }
            } else if current == 1 {
                if let _ = Int(String(char)) {
                    number.append(char)
                } else {
                    tail.append(char)
                    current += 1
                }
            } else {
                tail.append(char)
            }
        }
    }
}

