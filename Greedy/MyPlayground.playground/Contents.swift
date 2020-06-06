import UIKit


let before = Date() - (60 * 60 * 24 + (60*50))

let agoTime = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: before, to: Date())

print(Date().timeIntervalSince(before))

print(agoTime)

let df = DateFormatter()
df.dateFormat = "yyyy.MM.dd.hh.mm"
if let date = agoTime.date {
    print(df.string(from: date))
} else {
    print("시간을 알 수 없습니다.")
}

//let agoDate = Calendar.current.dateComponents([.hour, .minute], from: alarm.createdDate, to: Date()).minute
