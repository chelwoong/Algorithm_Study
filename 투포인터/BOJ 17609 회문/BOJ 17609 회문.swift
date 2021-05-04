

func isPalindrome(_ str: [Character], _ s: Int, _ e: Int, _ hasPass: Bool) -> Int {
    var s = s
    var e = e
    while s < e {
        if str[s] == str[e] {
            s += 1
            e -= 1
            continue
        } else if !hasPass {
            return 2
        } else {
            guard e-s > 1 else { return 1 }

            if isPalindrome(str, s+1, e, false) == 1 {
                return 1
            } else {
                return isPalindrome(str, s, e-1, false)
            }
        }
    }
    return hasPass ? 0 : 1
}

for _ in 0..<Int(readLine()!)! {
    let str = Array(readLine()!)
    print(isPalindrome(str, 0, str.count-1, true))
}
