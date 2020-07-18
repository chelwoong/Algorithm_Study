var set = Set<String>()
for _ in 0..<Int(readLine()!)! {
    set.insert(readLine()!)
}
var strs = Array(set)

strs.sort { (s1, s2) -> Bool in
    if s1.count == s2.count {
        return s1 < s2
    } else {
        return s1.count < s2.count
    }
}

for str in strs {
    print(str)
}
