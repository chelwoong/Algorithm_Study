let str = readLine()!

var zeroSection = 0
var oneSection = 0
var current: Character?
for char in str {
  guard let curr = current else {
    current = char
    continue
  }
  if char != curr {
    if char == "0" {
      zeroSection += 1
    } else {
      oneSection += 1
    }
    current = char
  }
}
print(max(zeroSection, oneSection))
