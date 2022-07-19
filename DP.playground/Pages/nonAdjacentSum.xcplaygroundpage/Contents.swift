//: [Previous](@previous)

import Foundation

/**
 non adjacent sum https://www.structy.net/problems/non-adjacent-sum
 Write a function, nonAdjacentSum, that takes in an array of numbers as an argument. The function should return the maximum sum of non-adjacent elements in the array. There is no limit on how many elements can be taken into the sum as long as they are not adjacent.
 
 For example, given:

 [2, 4, 5, 12, 7]

 The maximum non-adjacent sum is 16, because 4 + 12.
 4 and 12 are not adjacent in the array.
 */
func nonAdjacentSum(_ arr:[Int],_ i: Int = 0,_ memo: inout [Int:Int]) -> Int {
    if let val = memo[i] {
        return val
    }
    if i >= arr.count
    {
        return 0
    }
    let include = arr[i] + nonAdjacentSum(arr, i+2, &memo)
    let exclude = nonAdjacentSum(arr,i+1, &memo)
    memo[i] = max(include, exclude)
    return memo[i]!
}
var memo = [Int:Int]()
nonAdjacentSum([2, 4, 5, 12, 7],0,&memo)
