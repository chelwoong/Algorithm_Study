import UIKit

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func minDiffInBST(_ root: TreeNode?) -> Int {
    guard let val = root?.val else { return -1 }
    
    
    var minValue = 0
    
    if let left = root?.left {
        minValue = abs(val - left.val)
        let leftMin = minDiffInBST(root?.left)
        if leftMin != -1, leftMin < minValue {
            minValue = leftMin
        }
    }
    
    if let right = root?.right {
        if abs(val - right.val) < minValue {
            minValue = abs(val-right.val)
        }
        let rightMin = minDiffInBST(root?.right)
        if rightMin != -1, rightMin < minValue {
            minValue = rightMin
        }
    }
    
    return minValue
}

class Solution {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard let val = root?.val else { return -1 }
        if root?.left == nil, root?.right == nil { return -1 }
        var minValue = val
        print("minValue: \(minValue)")
        
        if let left = root?.left {
            minValue = abs(val - left.val)
            let leftMin = minDiffInBST(root?.left)
            print("left: \(minValue), \(leftMin)")
            
            if leftMin != -1, leftMin < minValue {
                minValue = leftMin
            }
            print("\(minValue)")
        }
        
        if let right = root?.right {
            if abs(val - right.val) < minValue {
                minValue = abs(val-right.val)
            }
            let rightMin = minDiffInBST(root?.right)
            print("right: \(minValue), \(rightMin)")
            
            if rightMin != -1, rightMin < minValue {
                minValue = rightMin
            }
            print("\(minValue)")
        }
        
        return minValue
    }
}


