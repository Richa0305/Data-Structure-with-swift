
//
//  Recursion.swift
//
//
//  Created by richa.e.srivastava on 09/03/2022.
//

import Foundation

// Meething Room ii - Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.)
/**
 Ex 1-
 Input: intervals = [(0,30),(5,10),(15,20)]
 Output: 2
 Explanation:
 We need two meeting rooms
 room1: (0,30)
 room2: (5,10),(15,20)
 
 
 0 ------------------------------------- 30
 5 ---10    15 --- 20
 
 So since there are two overlaps we will need two meeting rooms only
 
 For solution - First sort array by start, Take two arrays start
 start - [0, 5 , 15]
 end  -  [10, 20, 30]
 
 if start[i] < end[j] then increment i and count
 if start[i] >= end[j] then increment j and decrement count
 
 Ex2 -
 Input: intervals = [(2,7)]
 Output: 1
 Explanation:
 Only need one meeting room
 */
func meetingRoom2(arr: [(Int,Int)]) -> Int {
    
    if arr.count <= 1 {
        return arr.count
    }
    var count = 0
    var result = 0
    var i = 0
    var j = 0
    let startArr = arr.map { $0.0 }.sorted()
    let endArr = arr.map { $0.1 }.sorted()
    while i < arr.count {
        // print(startArr[i], endArr[j], count, i, j)
        if (startArr[i] < endArr[j]){
            count += 1
            i += 1
        } else {
            count -= 1
            j += 1
        }
        result = max(result, count)
    }
    
    return result
}
meetingRoom2(arr: [(0,30),(5,10),(15,20)])


/**
 Generate Parentheses
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 Example 1:
 
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:
 
 Input: n = 1
 Output: ["()"]
 
 
 
 n = 1
 
 open = 1. close = 1
 
 "" "1 1"
 "(" "0 1"
 "()" "0 0"
 
 n = 2
 
 open = 2. close = 2
 
 "" "2 2"
 "(" "1 2"
 "()" "1 1"              "((" "0 2"
 "()(" "0 1"             "(()" "0 1"
 "()()" "0 0"            "(())" "0 0"
 
 
 
 
 
 
 */
func generateParenthesis(_ n: Int) -> [String] {
    let result = solution(open: n, close: n, output: "")
    return result
}

func solution(open:  Int, close:  Int, output: String) -> [String] {
    var result = [String]()
    
    if open == 0 && close == 0  {
        result.append(output)
        return result
    }
    
    if open != 0 {
        let op = output + "("
        print("open called", op, open, close)
        result.append(contentsOf: solution(open: open - 1, close: close, output: op ))
    }
    if close > open {
        let op = output + ")"
        print("closed called", op, open, close)
        result.append(contentsOf: solution(open: open, close: close-1, output: op))
    }
    return result
}
generateParenthesis(2)

/**
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.
 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 
1st Approach -

    hit  cog    ["hot","dot","dog","lot","log","cog"]

    abcdefghijklmnopqrstuvwxyz

    queue = [(hit, 1), (hot, 2), (dot, 3), (dog, 4), (cog, 5)]
            
2nd Approach -
    ["*ot": "hot", "dot", "lot"]
    ["h*t": "hot"]
    ["ho*" : "hot"]
    ["d*t" : "dot"]
    ["do*" : "dot", "dog"]

    visitedSet = ["hit","hot", "dot", "dog", "cog"]

    queue = [(hit, 1), (hot, 2), (dot, 3) , (dog, 4), (cog, 5)]


*/

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    guard wordList.contains(endWord) else {
        return 0
    }
    var queue = [(String, Int)]()
    queue.append((beginWord, 1))
    
    var visitedSet = Set<String>()
    visitedSet.insert(beginWord)
    
    
    var dictPatters = [String: [String]]()
    
    for word in wordList {
        for (_, index) in word.indices.enumerated() {
            let generic = String(word[..<index]) + "*" + String(word[word.index(after: index)...])
            dictPatters[generic, default: []].append(word)
        }
    }
    while !queue.isEmpty {
        let (currentW, level) = queue.removeFirst()
        print(currentW)
        for (_,index) in currentW.indices.enumerated() {
            let generic = String(currentW[..<index]) + "*" + String(currentW[currentW.index(after: index)...])
            if let words = dictPatters[generic] {
                for nextWord in words {
                    if nextWord == endWord {
                        print(visitedSet)
                        return level + 1
                    }
                    if !visitedSet.contains(nextWord)   {
                        visitedSet.insert(nextWord)
                        queue.append((nextWord, level + 1))
                        
                    }
                }
            }
        }
        
    }
    print(visitedSet)
    return queue.first?.1 ?? 0
}
ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
