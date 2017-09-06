//: Playground - noun: a place where people can play
//Insertion sort - By Richa Srivastava
/*
sort by shifting the elements one by one and this is better than bubble
and selection sort. In this sort we take a key and compares it with the
elements ahead of it and puts the key in right place.
*/

import Foundation

var arr = [5,3,2,6,1,7,4]

var j = 0
var key = 0

for i in 1..<arr.count{
    j = i
    key = arr[i]
    
    for j in stride(from: j, to: 0, by: -1){
        if arr[j-1] > key{
            var temp = 0
            temp = arr[j]
            arr[j] = arr[j-1]
            arr[j-1] = temp
        }
    }
}
print(arr)

/*
Worst Case Time Complexity : O(n2)
Best Case Time Complexity : O(n)
Average Time Complexity : O(n2)
Space Complexity : O(1)
*/
