import Foundation

func solution(_ record:[String]) -> [String] {
    
    var userTable = [String:String]()
    var printRecords = [(id: String, text: String)]()
    
    for recordElement in record {
        let splited = recordElement.components(separatedBy: " ")
        let cmd = splited[0]
        let id = splited[1]
        
        if cmd == "Leave" {
            printRecords.append((id: id, text: "님이 나갔습니다."))
        } else if cmd == "Change" {
            let name = splited[2]
            userTable[id] = name
        } else {
            let name = splited[2]
            userTable[id] = name
            printRecords.append((id: id, text: "님이 들어왔습니다."))
        }
    }
    
    return printRecords.map { userTable[$0.id]! + $0.text }
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
