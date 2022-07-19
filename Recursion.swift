//
//  Recursion.swift
//  
//
//  Created by richa.e.srivastava on 09/03/2022.
//

import Foundation

/**
 https://www.youtube.com/watch?v=kHi1DUhp9kM&list=PL_z_8CaSLPWeT1ffjiImo0sYTcnLzo-wY

 Identify Recusion problem - if problem contains [Choice] + [Decisions]

 <img width="1256" alt="Screenshot 2022-03-09 at 08 00 04" src="https://user-images.githubusercontent.com/10761678/157381720-4a291db1-e46a-4769-855d-f7a7f685bb80.png">

 How to solve recursion problem - Make smaller input in every recursive call
 1. Base Conditions -  smallest valid input values
 2. Hypothesis - design the function which gives output
 3. Induction - Logic for output

 

 **/
import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(val: Int) {
        self.value = val
    }
}
var node1 = Node(val: 1)
var node2 = Node(val: 2)
var node3 = Node(val: 3)
node1.left = node2
node2.left = node3
func bineryTreeHeight(node: Node?) -> Int {
    var height = 0
    
    if node == nil {
        return height
    }
    var leftHeight = bineryTreeHeight(node: node?.left)
    var rightHeight = bineryTreeHeight(node: node?.right)
    height = 1 + max(leftHeight, rightHeight)
    return height
    
}
bineryTreeHeight(node: node1)
