//: [Previous](@previous)

import Foundation

/**
 
 array stepper https://www.structy.net/problems/array-stepper
 Write a function, arrayStepper, that takes in an array of numbers as an argument. You start at the first position of the array. The function should return a boolean indicating whether or not it is possible to reach the last position of the array. When situated at some position of the array, you may take a maximum number of steps based on the number at that position.
 For example, given:

     idx =  0  1  2  3  4  5
 numbers = [2, 4, 2, 0, 0, 1]

 The answer is true.
 We start at idx 0, we could take 1 step or 2 steps forward.
 The correct choice is to take 1 step to idx 1.
 Then take 4 steps forward to the end at idx 5.
 */


func arrayStepper(_ arr:[Int],_ i: Int) -> Bool {
    if i >= arr.count - 1 {
        return true
    }
    let maxStep = arr[i]
    if maxStep > 0 {
        for step in 1...maxStep {
            if arrayStepper(arr, step + i) {
                print(i)
                return true
            }
        }
    }
    return false
}
arrayStepper([2, 4, 2, 0, 0, 1], 0)




func arrayStepperDP(_ arr:[Int],_ i: Int,_ memo: inout [Int:Bool]) -> Bool {
    if let val = memo[i] {
        return val
    }
    if i >= arr.count - 1 {
        return true
    }
    let maxStep = arr[i]
    if maxStep > 0 {
        for step in 1...maxStep {
            if arrayStepperDP(arr, step + i, &memo) {
                memo[i] = true
                return true
            }
        }
    }
    memo[i] = false
    return false
}
var memo : [Int: Bool] = [:]
arrayStepperDP([2, 4, 2, 0, 0, 1], 0, &memo)
