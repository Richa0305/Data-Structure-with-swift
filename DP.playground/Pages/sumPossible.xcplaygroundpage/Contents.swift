
/**
 sumPossible https://www.structy.net/problems/sum-possible
 Write a function sumPossible that takes in an amount and an array of positive numbers. The function should return a boolean indicating whether or not it is possible to create the amount by summing numbers of the array. You may reuse numbers of the array as many times as necessary.

 You may assume that the target amount is non-negative.
 
 sumPossible(8, [5, 12, 4]); // -> true, 4 + 4
                        8
                3                               4
                               0
 */

func sumPossible(target: Int, arr: [Int]) -> Bool {
    //print(target)
    if target == 0 {
        return true
    }
    
    if target < 0 {
        return false
    }
    
    for num in arr {
        if sumPossible(target: target - num, arr: arr) {
            return true
        }
    }
    
    return false
}
sumPossible(target: 8, arr:  [5, 12, 4])

func sumPossibleWithPD(target: Int, arr: [Int], memo : inout [Int: Bool]) -> Bool {
    //print(target)
    if let flag = memo[target] {
        return flag
    }
    if target == 0 {
        return true
    }
    
    if target < 0 {
        return false
    }
    
    for num in arr {
        if sumPossibleWithPD(target: target - num, arr: arr, memo: &memo) {
            print(num)
            memo[target] = true
            return true
        }
    }
    memo[target] = false
    print(memo)
    return false
}
var memo = [Int:Bool]()
sumPossibleWithPD(target: 8, arr:  [5, 12, 4],memo: &memo)
