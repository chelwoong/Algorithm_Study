import Foundation

let n = Int(readLine()!)!

class Node {
  var value: Int
  var parents: Node?
  var children = [Node]()

  init(_ value: Int) {
    self.value = value
  }

  func addChild(_ child: Node) {
    children.append(child)
    child.parents = self
  }

  func removeFromParents() {
    if let index = parents?.children.firstIndex(where: { $0.value == value }) {
      parents?.children.remove(at: index)
    }
  }

  func removeAllChilds() {
    children.forEach { $0.removeAllChilds() }
    children.removeAll()
  }

  func leafCount() -> Int {
    guard !children.isEmpty else { return 1 }
    var count = 0
    children.forEach {
      count += $0.leafCount()
    }
    return count
  }
}

let parentIndies = readLine()!.split(separator: " ").map({ Int(String($0))! })
var nodeTemps = [Node]()
(0..<n).forEach {
  nodeTemps.append(Node($0))
}
var treeNode: Node?

for (current, parents) in parentIndies.enumerated() {
  if parents == -1 {
    treeNode = nodeTemps[current]
  } else {
    nodeTemps[parents].addChild(nodeTemps[current])
  }
}

let remove = Int(readLine()!)!
nodeTemps[remove].removeAllChilds()
nodeTemps[remove].removeFromParents()
if nodeTemps[remove].value == treeNode?.value ?? -1 {
  treeNode = nil
}
nodeTemps.removeAll()

print(treeNode?.leafCount() ?? 0)
