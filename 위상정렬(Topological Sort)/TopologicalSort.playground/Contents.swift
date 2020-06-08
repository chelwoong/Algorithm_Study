import UIKit

struct Graph<T>: Equatable where T: Equatable {
    var childs: [T]
    
    mutating func push(_ child: T) {
        self.childs.append(child)
    }
}

var n = 5
var inDegree = [Int](repeating: 0, count: n) // 각 정점의 진입차수 정보
var trees = [Graph<Int>]()

func topologicalSort() -> [Int] {
    // 결과를 담을 배열과 queue가 필요하다.
    var result = [Int]()
    var q = [Int]()
    
    // 진입차수가 0인 노드를 큐에 담는다.
    for i in 0..<n {
        print(i)
        if inDegree[i] == 0 { q.append(inDegree[i]) }
    }
    
    // 위상정렬은 총 n 번만 실행되어야 한다.
    for _ in 0..<n {
        
        // 큐가 비어있으면 사이클이 생긴 것이다.
        if q.isEmpty {
            print("사이클이 생겨버렸어요 ⁉️")
            return
        }
        
        // 큐에서 노드를 하나 꺼내고 인접 간선을 모두 제거한다.
        // 진입차수가 0인 노드를 큐에 담고를 반복한다.
        result.append(q.first!) // 위에서 확인하고 왔으므로 큐가 비어있지 않음이 보장된다.
        let node = q.removeFirst()
        
        for child in trees[node].childs {
            inDegree[child] -= 1
            if inDegree[child] == 0 {
                // 새롭게 진입차수가 0 이 된 노드를 큐에 삽입한다.
                q.append(child)
            }
        }
    }
    
    return result
}

func main() {
    trees = [Graph<Int>](repeating: .init(childs: []), count: n)
    trees[0].push(1)
    inDegree[1] += 1
    trees[1].push(2)
    inDegree[2] += 1
    trees[1].push(3)
    inDegree[3] += 1
    trees[2].push(3)
    inDegree[3] += 1
    trees[3].push(4)
    inDegree[4] += 1
    
    print(topologicalSort())
}

main()
