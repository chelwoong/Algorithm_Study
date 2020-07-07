import Foundation

func solution(_ citations:[Int]) -> Int {
  let sortedCitations = citations.sorted(by: >)
  for (index, citation) in sortedCitations.enumerated() {
    if citation <= index+1 {
      return index+1 == citation ? index+1 : index
    }
  }

  return citations.count
}
