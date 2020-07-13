var total = 0
var hobit = [Int]()
for _ in 0..<9 {
    let n = Int(readLine()!)!
    hobit.append(n)
    total += n
}
hobit.sort()

func findHobit() {
    for one in 0..<9 {
        for two in one+1..<9 {
            if (total - hobit[one] - hobit[two]) == 100 {
                for i in 0..<9 {
                    guard i != one && i != two else { continue }
                    print(hobit[i])
                }
                return
            }
        }
    }
}
findHobit()
