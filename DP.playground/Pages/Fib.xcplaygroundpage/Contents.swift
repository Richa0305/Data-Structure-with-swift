//: [Previous](@previous)

import Foundation

/**
 fib - https://www.structy.net/problems/fib
 Write a function fib that takes in a number argument, n, and returns the n-th number of the Fibonacci sequence.
 The 0-th number of the sequence is 0.
 The 1-st number of the sequence is 1.
 To generate further numbers of the sequence, calculate the sum of previous two numbers.
 
    0     1      1      2       3       5       8       13      21
 
 */

func fib(num: Int, memo: inout [Int:Int]) -> Int {
    if memo.keys.contains(num) {
        return memo[num]!
    }
    if num == 0 || num == 1 {
        return num
    }
    memo[num] = fib(num: num-1, memo: &memo) + fib(num: num-2,memo: &memo)
    return memo[num]!
}
var memo = [Int:Int]()
fib(num: 8,memo: &memo)
