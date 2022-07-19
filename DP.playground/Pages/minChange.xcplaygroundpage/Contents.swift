/**
 
 min change https://www.structy.net/problems/min-change
 Write a function minChange that takes in an amount and an array of coins. The function should return the minimum number of coins required to create the amount. You may use each coin as many times as necessary.

 If it is not possible to create the amount, then return -1.
 
 minChange(8, [1, 5, 4, 12]); // -> 2, because 4+4 is the minimum coins possible
 */
import Foundation

func minChange(target: Int, arr: [Int], memo: inout [Int:Int]) -> Int {
    if let val = memo[target] {
        return val
    }
    if arr.isEmpty {
        return -1
    }
    if target == 0 {
        return 0
    }
    if target < 0 {
        return 999999
    }
    var minVal = 999999
    for item in arr {
        
        memo[target] =  min(1 + minChange(target: target - item, arr: arr,memo: &memo), minVal)
        minVal = memo[target]!
    }
    
    
    return minVal
}
var memo = [Int:Int]()
minChange(target: 8, arr: [1, 5, 4, 12], memo: &memo)
