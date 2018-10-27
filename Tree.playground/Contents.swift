//: Playground - noun: a place where people can play
// By Richa Srivastava
//Tree With Swift


// [2,3,4,5,6,7,8] make binary tree for this array

import Foundation
/*
 5
 3          7
 2       4   6      8
 */
let arr = [2,3,4,5,6,7,8]
var arr2 = [Int]()

class Node{
    var value: Int
    var leftNode: Node?
    var rightNode: Node?
    
    init(value:Int) {
        self.value = value
    }
}


func binaryTree(arr:[Int], firstIndex:Int, lastIndex:Int) -> Node?{
    
    if lastIndex < firstIndex{
        return nil
    }
    let mid = (lastIndex - firstIndex)/2 + firstIndex // Adding fisrtIndex, since mid value would be different for different arrays, and adding firstIndex gets the correct mid index
    let node = Node(value: arr[mid])
    node.leftNode = binaryTree(arr: arr, firstIndex: firstIndex, lastIndex: mid-1)
    node.rightNode = binaryTree(arr: arr, firstIndex: mid + 1, lastIndex: lastIndex)
    return node
}

func searchBinary(node:Node?,searchVal:Int) -> Bool{
    if node?.value == searchVal{
        return true
    }
    if searchVal < (node?.value)!{
        searchBinary(node: node?.leftNode, searchVal: searchVal)
    }else{
        searchBinary(node: node?.rightNode, searchVal: searchVal)
    }
    return false
}


func maxDepth(rootNode:Node?) -> Int{
    guard rootNode != nil else  {
        return 0
    }
    let leftDepth = maxDepth(rootNode: rootNode?.leftNode)
    let rightDepth = maxDepth(rootNode: rootNode?.rightNode)
    //    print(" rootnode \(rootNode?.value ?? 0) leftNode \(rootNode?.leftNode?.value ?? 0) \(leftDepth)")
    //    print(" rootnode \(rootNode?.value ?? 0) rightNode \(rootNode?.rightNode?.value ?? 0) \(rightDepth)")
    //    print("----")
    if leftDepth > rightDepth {
        return (leftDepth + 1)
    }else{
        return (rightDepth + 1)
    }
    
}


func mirrorTree(rootNode:Node?) -> Node?{
    guard rootNode != nil else  {
        return nil
    }
    mirrorTree(rootNode: rootNode?.leftNode)
    mirrorTree(rootNode: rootNode?.rightNode)
    
    let temp = rootNode?.leftNode
    rootNode?.leftNode = rootNode?.rightNode
    rootNode?.rightNode = temp
    
    return rootNode
}


func treeToArray(node:Node?) -> [Int]?{
    
    if node == nil {
        return nil
    }
    
    treeToArray(node: node?.rightNode)
    arr2.append(node?.value ?? 0)
    treeToArray(node: node?.leftNode)
    
    return arr2
}

let tree = binaryTree(arr: arr, firstIndex: 0, lastIndex: arr.count-1)
print("==Printing root of tree ====")
print(tree?.value ?? 0)
print(tree?.leftNode?.value ?? 0)
print(tree?.rightNode?.value ?? 0)


print("==binary search ====")
print(searchBinary(node: tree, searchVal: 6))


print("====Max Depth of the tree=====")
print(maxDepth(rootNode: tree))

print("====Mirror a tree=====")
let mirrorNode = mirrorTree(rootNode: tree)
print(mirrorNode?.value ?? 0)
print(mirrorNode?.leftNode?.value ?? 0)
print(mirrorNode?.rightNode?.value ?? 0)


print("====convert tree to array =====")
let convertedArr = treeToArray(node: tree)
print(convertedArr!)