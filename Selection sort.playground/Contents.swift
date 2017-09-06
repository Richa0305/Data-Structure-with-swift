//: Playground - noun: a place where people can play
// Selection Sort - By Richa Srivastava
/*
In this sort we first find the smallest element in the array and exchanges it with the element in the first position, then finds the second smallest element and replace it with the element in second position and continues in same way for the entire array.
*/

import Foundation
var arr = [4,3,5,6,1,2]

var min = 0
var j = 0
for i in 0..<arr.count{
    min = i
    j = i+1
    for j in stride(from: j, to: arr.count, by: 1){
        if(arr[min] > arr[j]){
            min = j
        }
    }
    var temp = arr[i]
    arr[i] = arr[min]
    arr[min] = temp
}
print(arr)

/*
Time Complexity –  worst – O(n^2), best – O(n^2) and Average – O(n^2)
*/