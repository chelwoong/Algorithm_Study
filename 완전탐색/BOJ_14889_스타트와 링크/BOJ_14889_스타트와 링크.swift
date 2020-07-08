let n = Int(readLine()!)!
var members = [[Int]]()
var minDifference = Int.max

for _ in 0..<n {
    members.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

func getDifference(of team: Set<Int>) -> Int {
    var myTeam = [Int]()
    var otherTeam = [Int]()
    
    var difference = 0
    
    for member in 0..<n {
        if team.contains(member) {
            for t in myTeam {
                difference += members[member][t]
                difference += members[t][member]
            }
            myTeam.append(member)
        } else {
            for t in otherTeam {
                difference -= members[member][t]
                difference -= members[t][member]
            }
            otherTeam.append(member)
        }
    }
    return abs(difference)
}

func makeTeam(team: Set<Int>, current: Int) {
    if team.count == n/2 {
        print(team)
        minDifference = min(minDifference, getDifference(of: team))
        return
    }
    if current < members.count {
        makeTeam(team: team, current: current+1)
        var newTeam = team
        newTeam.insert(current)
        makeTeam(team: newTeam, current: current+1)
    }
}

for people in 0..<n/2 {
    makeTeam(team: Set<Int>(arrayLiteral: people), current: people+1)
}

print(minDifference)
