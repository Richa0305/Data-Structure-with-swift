//: Playground - noun: a place where people can play
// By Richa Srivastava
//Binary Search - Iterative with swift


import Foundation


var arr = [1,2,3,4,5,6,7,8,9]


func binarySearchIterative(num:Int) -> Bool{
    var firstIndex = 0
    var lastIndex = arr.count - 1
    
    while firstIndex <= lastIndex {
        
        let mid = (firstIndex + lastIndex)/2
        if arr[mid] == num{
            return true
        }
        if num < arr[mid] {
            lastIndex = mid - 1
        }
        if num > arr[mid] {
            firstIndex = mid + 1
        }
    }
    return false
}


func linearSearch(num:Int) -> Bool{
    for x in arr{
        if num == x{
            return true
        }
    }
    return false
}

print(linearSearch(num: 17))
print(binarySearchIterative(num: 7))
