import Foundation

/**
 * 소풍 (문제 ID: PICNIC, 난이도: 하)
 * - 친구인 학생끼리 짝을 지어주는 방법의 수 구하기
 *
 * 제한 사항
 * - 1초, 64MB 이하 메모리 사용
 *
 * 입력
 * - 첫 줄에 테스트 케이스의 수 C (C<=50)
 * - 각 테스트 케이스 첫 줄에 학생의 수 n(2<=n<=10)
 * - 그 다음 줄에 m개의 정수 쌍으로 서로 친구인 두 학생의 번호가 주어짐
 *
 * 예제 입력
 * 3
 * 2 1
 * 0 1
 * 4 6
 * 0 1 1 2 2 3 3 0 0 2 1 3
 * 6 10
 * 0 1 0 2 1 2 1 3 1 4 2 3 2 4 3 4 3 5 4 5
 */

func countPairings(_ areFriends: [[Bool]], _ taken: [Bool]) -> Int {
    
    var firstFree = -1
    var taken = taken
    for i in 0..<taken.count {
        if !taken[i] { firstFree = i }
    }
    // 기저사례: 모든 학생이 짝을 다 찾았으면 return 1
    if firstFree == -1 { return 1 }
    
    var ret = 0
    
    // 짝이 없는 친구과 짝이 될 수 있는 경우 탐색
    for pairWith in 0..<areFriends.count {
        if !taken[pairWith], areFriends[firstFree][pairWith] {
            taken[firstFree] = true
            taken[pairWith] = true
            ret += countPairings(areFriends, taken)
            taken[firstFree] = false
            taken[pairWith] = false
        }
    }
    
    return ret
    
}

func picnic(_ n: Int, _ pairCount: Int, _ pair: [Int]) {
    var areFriends = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var taken = [Bool](repeating: false, count: n)
    
    for i in stride(from: 0, to: pair.count, by: 2) {
        areFriends[pair[i]][pair[i+1]] = true
        areFriends[pair[i+1]][pair[i]] = true
    }
    
    let ret = countPairings(areFriends, taken)
    //print(ret)
}

//picnic(2, 1, [0, 1])
//picnic(4, 6, [0, 1, 1, 2, 2, 3, 3, 0, 0, 2, 1, 3])
picnic(6, 10, [0, 1, 0, 2, 1, 2, 1, 3, 1, 4, 2, 3, 2, 4, 3, 4, 3, 5, 4, 5])
