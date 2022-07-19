
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
    // Base Condition
    if node == nil {
        return height
    }
    //Hypothesis
    let leftHeight = bineryTreeHeight(node: node?.left)
    let rightHeight = bineryTreeHeight(node: node?.right)
    //Induction
    height = 1 + max(leftHeight, rightHeight)
    return height
    
}
bineryTreeHeight(node: node1)



// Letter case permutation
/**
 "" "a1b2"
 
 "a""1b2"                 "A""1b2"
 "a1""b2"                  "A1""b2"
 
 "a1b""2"     "a1B2"       "A1b""2"    "A1B""2"
 "a1b2"        "a1B2"      "A1b2"      "A1B2"
 
 */


func letterCasePermutation(_ s: String) -> [String] {
    var result = [String]()
    result = letterCaseSolve(ip: s, op: "")
    return result
}
func letterCaseSolve(ip: String, op: String) -> [String] {
    var result = [String]()
    if (ip.count == 0) {
        result.append(op)
        return result
    }
    if let firstChar = ip.first, firstChar.isLetter {
        var op1 = op
        var op2 = op
        op1.append(firstChar.lowercased())
        op2.append(firstChar.uppercased())
        let input = ip.dropFirst()
        result.append(contentsOf: letterCaseSolve(ip: String(input), op: op1))
        result.append(contentsOf: letterCaseSolve(ip: String(input), op: op2))
    }
    if let firstChar = ip.first, firstChar.isNumber {
        var op1 = op
        op1.append(firstChar)
        let input = ip.dropFirst()
        result.append(contentsOf: letterCaseSolve(ip: String(input), op: op1))
    }
    
    return result
}
letterCasePermutation("3z4")




// generate balanaced paranthesis
/**
 " " "3 3"
 "("" 2 3"
 "((" "1 3"                                                      "()" "2 2"
 "(((" "0 3"                     "(()" "1 2"                                  "()(" "1 2"
 "((()" "0 2"       "(())" "1 1"        "(()(" "0 2"         "()((" "0 2"              "()()" "1 1"
 "((())" "0 1"    "(())(" "0 1"         "(()()" "0 1"        "()(()" "0 1"           "()()(" "0 1"
 "((()))" "0 0"   "(())()" "0 0"       "(()())" "0 0"       "()(())" "0 0"           "()()()" "0 0"
 */

func generateBalancedParanthesis(n: Int) -> [String] {
    var result = [String]()
    result = generateParanthesis(open: n, close: n, op: "")
    return result
}
func generateParanthesis(open:Int, close:Int, op: String) -> [String]{
    var result = [String]()
    if open == 0 && close == 0 {
        result.append(op)
        return result
    }
    if open != 0 {
        var op1 = op
        op1.append("(")
        result.append(contentsOf: generateParanthesis(open: open-1, close: close, op: op1))
    }
    if close > open {
        
        var op1 = op
        op1.append(")")
        result.append(contentsOf: generateParanthesis(open: open, close: close-1, op: op1))
    }
    
    return result
}
generateBalancedParanthesis(n: 3)

// Sliding Window - Minimum Window Substring

func minWindow(_ s: String, _ t: String) -> String {
    var result = ""
    var tDict = [Character: Int]()
    for char in t {
        tDict[char, default: 0] += 1
    }
    var start = 0
    var end = 0
    let sArray = Array(s)
    var count = tDict.count
    while end < sArray.count {
        if let _ = tDict[sArray[end]] {
            tDict[sArray[end]]! -= 1
            if tDict[sArray[end]]! == 0 {
                count -= 1
               // print(count, tDict)
                while count == 0 {
                    if let startCharCount = tDict[sArray[start]] {
                        if startCharCount < 0 {
                            tDict[sArray[start]]! += 1
                        } else if startCharCount == 0 {
                            tDict[sArray[start]]! += 1
                            //result = String(sArray[start..<end+1])
                            if result == "" {
                                result = String(sArray[start..<end+1])
                            } else {
                                if result.count > sArray[start..<end+1].count {
                                    result = String(sArray[start..<end+1])
                                }
                            }
                            print(result)
                        }
                        if tDict[sArray[start]]! == 1 {
                            count += 1
                        }
                    }
                    
                    start += 1
                }
                
            }
        }
        end += 1
    }
    
    return result
}
minWindow("cabwefgewcwaefgcf",
          "cae")
