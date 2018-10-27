//: Playground - noun: a place where people can play
// By Richa Srivastava
//Tree With Swift

// 6 + 9 * 7 solve mathmetical evaluation with swift using tree data structure
/*
 +
 *       6
 
 9     7
 
 */
import Foundation

class Node{
    var operation:String?
    var value: Int?
    var leftNode: Node?
    var rightNode: Node?
    
    init(op:String?,val:Int?,left:Node?,right:Node?) {
        self.value = val
        self.operation = op
        self.leftNode = left
        self.rightNode = right
    }
}

let ninethNode = Node(op: nil, val: 9, left: nil, right: nil)
let sixthNode = Node(op: nil, val: 6, left: nil, right: nil)
let seventhhNode = Node(op: nil, val: 7, left: nil, right: nil)
let multOpNode = Node(op: "*", val: nil, left: ninethNode, right: seventhhNode)
let plusOpNode = Node(op: "+", val: nil, left: multOpNode, right: sixthNode)

func evaluateUsingAbstractTree(node:Node?) -> Int{
    if node?.value != nil {
        return (node?.value)!
    }
    
    if (node?.operation)! == "+" {
        return evaluateUsingAbstractTree(node: node?.leftNode) + evaluateUsingAbstractTree(node: node?.rightNode)
    }else if node?.operation == "*" {
        return evaluateUsingAbstractTree(node: node?.leftNode) * evaluateUsingAbstractTree(node: node?.rightNode)
    }else if node?.operation == "-" {
        return evaluateUsingAbstractTree(node: node?.leftNode) - evaluateUsingAbstractTree(node: node?.rightNode)
    }else if node?.operation == "/" {
        return evaluateUsingAbstractTree(node: node?.leftNode) / evaluateUsingAbstractTree(node: node?.rightNode)
    }
    return 0
}


print(evaluateUsingAbstractTree(node: plusOpNode))


print(6 + 9 * 7)
