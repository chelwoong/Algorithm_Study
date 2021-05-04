
var str = readLine()!
var result = ""
var oper = ""

for char in str {
    if char == "(" {
        oper.append("(")
    } else if char == ")" {
        while let opr = oper.popLast() {
            guard opr != "(" else { break }
            result.append(opr)
        }
    } else if char == "*" || char == "/" {
        guard !oper.isEmpty else { oper.append(char); continue }
        
        while let opr = oper.last, (opr == "*" || opr == "/") {
            result.append(oper.popLast()!)
        }
        oper.append(char)
    } else if char == "+" || char == "-" {
        guard !oper.isEmpty else { oper.append(char); continue }
        while let opr = oper.popLast() {
            guard opr != "(" else { oper.append(opr); break }
            result.append(opr)
        }
        oper.append(char)
    } else {
        result.append(char)
    }
}

print(result + oper.reversed())

// 1+2*3
// (A+B)*(C-D)
// A+B/C*D*(E+F)
// (A+B*C)*(A+B/D)
