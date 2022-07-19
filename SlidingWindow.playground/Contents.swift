
//
//  Recursion.swift
//
//
//  Created by richa.e.srivastava on 09/03/2022.
//

import Foundation

/**
 https://www.youtube.com/watch?v=EHCGAZBbB88&list=PL_z_8CaSLPWeM8BDJmIYDaoQ5zuwyxnfj
 
 Problem can contain -
 
 Array/String + SubArray/SubString + Maximum/Largest/Minimum + k window size + get largest window or smaller window
 
 Ex - Given array get sum of all the subarray with size 3
 
 Ex - Given array get largest subarray whose sum is 10
 
 
 **/
import Foundation

// 1.Given array get maximum sum of subarray of size k

func maximumSumSubArray(arr: [Int],k:Int) -> Int {
    var maxSum = 0
    var start = 0
    var end = 0
    var sum = 0
    
    while end < arr.count {
        sum = sum + arr[end]
        if ((end - start) + 1) >= k {
            if maxSum < sum {
                maxSum = sum
            }
            sum = sum - arr[start]
            start += 1
            end += 1
        }
        end += 1
    }
    
    return maxSum
}
maximumSumSubArray(arr: [1,2,3,1,2,3,4], k: 3)


// find first negative number in every window subarray


func firstNegativeSubArray(arr: [Int],k:Int) -> [Int] {
    var resultList = [Int]()
    var negativeList = [Int]()
    var start = 0
    var end = 0
    
    while end < arr.count {
        if arr[end] < 0 {
            negativeList.append(arr[end])
        }
        if ((end-start)+1) >= k {
            if negativeList.isEmpty {
                resultList.append(0)
            }else {
                resultList.append(negativeList[0])
                if arr[start] == negativeList[0] {
                    negativeList.removeFirst()
                }
            }
            start += 1
        }
        end += 1
        
    }
    
    return resultList
}

firstNegativeSubArray(arr: [12, -1, -7, 8, 15, 9], k: 3)

// count occurances of anagram


func countAnagramOccurance(str: String, ptr: String) -> Int {
    var count = 0
    let k = ptr.count
    
    var ptrDict = [Character:Int]()
    for char in ptr {
        ptrDict[char, default: 0] += 1
    }
    ptrDict
    var windowDict = [Character:Int]()
    
    var start = 0
    var end = 0
    for char in str {
        windowDict[char, default: 0] += 1
        if ((end-start)+1) >= k {
            if windowDict == ptrDict {
                count += 1
            }
            let startChar = Array(str)[start]
            if let val = windowDict[startChar], val > 1 {
                windowDict[startChar] = val - 1
            } else {
                windowDict[startChar] = nil
            }
            start += 1
        }
        
        end += 1
    }
    
    
    return count
}
countAnagramOccurance(str: "forxxforxxorfddfro", ptr: "for")


// Maximum of all subarrays of size k


func maxOfSubArray(arr: [Int],k:Int) -> [Int] {
    var result = [Int]()
    var queue = [Int]()
    
    var start = 0
    var end = 0
    
    while end < arr.count {
        if queue.isEmpty {
            queue.append(arr[end])
        } else {

            for val in queue {
                if val < arr[end] {
                    queue.removeLast()
                }
            }
            queue.append(arr[end])
        }
        print("queue ",queue)
        if ((end-start)+1) >= k {
            result.append(queue.first!)
            print("result ",result)
            if queue.first == arr[start] {
                queue.removeFirst()
            }
            start += 1
        }
        end += 1
    }
    
    
    
    return result
}
//maxOfSubArray(arr: [1,-1], k: 1)


// longest substring with k unique charecters

func longestSubstringWithUniques(str :String,k:Int) -> String {
    var result = ""
    var charsCountDict = [Character: Int]()
    var start = 0
    var end = 0
    let arrStr = Array(str)
    
    while end < arrStr.count {
        charsCountDict[arrStr[end], default: 0] += 1
        if charsCountDict.count == k {
            let subString = String(arrStr[start..<(end+1)])
            if result.count <  subString.count {
                result = subString
            }
        } else if charsCountDict.count > k {
            while charsCountDict.count > k {
                if let startCount = charsCountDict[arrStr[start]] {
                    if startCount >= 1 {
                        charsCountDict[arrStr[start]]! -= 1
                        if charsCountDict[arrStr[start]]! == 0 {
                            charsCountDict[arrStr[start]] = nil
                        }
                    }
                }
                start += 1
            }
        }
        end += 1
    }
    return result
}
longestSubstringWithUniques(str: "aabacbebebe", k: 3)

// longest substring with no repeating chars

func longestSubstringWithNoRepeating(str :String,k:Int) -> Int {
    var result = 0
    var charsCountDict = [Character: Int]()
    var start = 0
    var end = 0
    let arrStr = Array(str)
    
    while end < arrStr.count {
        charsCountDict[arrStr[end], default: 0] += 1
        if charsCountDict.count == ((end-start)+1) {
            let subString = String(arrStr[start..<(end+1)])
            if result <  subString.count {
                result = subString.count
            }
        } else if charsCountDict.count < ((end-start)+1) {
            while charsCountDict.count < ((end-start)+1) {
                if let startCount = charsCountDict[arrStr[start]] {
                    if startCount >= 1 {
                        charsCountDict[arrStr[start]]! -= 1
                        if charsCountDict[arrStr[start]]! == 0 {
                            charsCountDict[arrStr[start]] = nil
                        }
                    }
                }
                start += 1
            }
        }
        end += 1
    }
    return result
}
longestSubstringWithNoRepeating(str: "pwwkew", k: 3)
