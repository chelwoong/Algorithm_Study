
// https://programmers.co.kr/learn/courses/30/lessons/17683

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = replaceSharp(music: m)
    let parsedInfos = musicinfos
        .map { info -> (Int, String, String) in
            let (playTime, title, music) = parseMusic(for: info)
            let replacedMusic = replaceSharp(music: music)
            let playedMusic = repeatMusic(playTime: playTime, music: replacedMusic)
            return (playTime, title, playedMusic)
        }
    .sorted { $0.0 > $1.0 }
    
    for info in parsedInfos {
        let (_, title, playedMusic) = info
        if playedMusic.contains(m) {
            return title
        }
    }
    
    return "(None)"
}

func replaceSharp(music: String) -> String {
    var replacedMusic = music
    replacedMusic = replacedMusic.replacingOccurrences(of: "C#", with: "c")
    replacedMusic = replacedMusic.replacingOccurrences(of: "D#", with: "d")
    replacedMusic = replacedMusic.replacingOccurrences(of: "F#", with: "f")
    replacedMusic = replacedMusic.replacingOccurrences(of: "G#", with: "g")
    replacedMusic = replacedMusic.replacingOccurrences(of: "A#", with: "a")
    return replacedMusic
}

func parseMusic(for info: String) -> (Int, String, String) {
    let parsed = info.split(separator: ",").map { String($0) }
    let playTime = parseToSecond(parsed[1]) - parseToSecond(parsed[0])
    return (playTime, parsed[2], parsed[3])
}

func parseToSecond(_ time: String) -> Int {
    let parsed = time.split(separator: ":").map { Int($0)! }
    return parsed[0] * 60 + parsed[1]
}

func repeatMusic(playTime: Int, music: String) -> String {
    var repeatedMusic = ""
    let musicTime = music.count
    repeatedMusic += String(repeating: music, count: (playTime / musicTime))
    repeatedMusic += music.dropLast(musicTime - (playTime % musicTime))
    return repeatedMusic
}

//print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
