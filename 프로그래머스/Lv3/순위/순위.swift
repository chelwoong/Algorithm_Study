import Foundation

struct Player {
    var win: Set<Int>
    var lose: Set<Int>
}

func checkPlayer(player: Int, checked: inout Set<Int>, type: Int, in players: [Player]) {
    checked.insert(player)
    // type == 0 승자, type == 1 패자
    if type == 0 {
        for winner in players[player].win {
            if checked.contains(winner) { continue }
            checkPlayer(player: winner, checked: &checked, type: type, in: players)
        }
        //print("player: \(player), 승자: \(checked)")
    } else {
        for loser in players[player].lose {
            if checked.contains(loser) { continue }
            checkPlayer(player: loser, checked: &checked, type: type, in: players)
        }
        //print("player: \(player), 패자: \(checked)")
    }
}

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var players = [Player](repeating: Player(win: [], lose: []), count: n)

    for result in results {
        let winner = result[0]-1
        let loser = result[1]-1
        players[winner].win.insert(loser)
        players[loser].lose.insert(winner)
    }
    
    var numberOfCheckedPlayer = 0
    for player in players {
        var winners = Set<Int>()
        for winner in player.win {
            checkPlayer(player: winner, checked: &winners, type: 0, in: players)
        }
        
        var losers = Set<Int>()
        for loser in player.lose {
            checkPlayer(player: loser, checked: &losers, type: 1, in: players)
        }
        if (winners.count + losers.count) == n-1 {
            numberOfCheckedPlayer += 1
        }
    }
    
    return numberOfCheckedPlayer
}
