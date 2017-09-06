//: Playground - noun: a place where people can play
// By Richa Srivastava
//Bubble Sort With Swift
/*
Bubble sort compares all the elements one by one and sort them based on their values. It is called Bubble sort because with each iteration, smaller element in the list bubbles up towards the first place.
*/

import Foundation

var arr = [3,4,2,5,7,6,1]

for i in 0..<arr.count{
    for j in 0..<(arr.count-i-1){
        if (arr[j] > arr[j+1]){
            var temp = 0
            temp = arr[j+1]
            arr[j+1] = arr[j]
            arr[j] = temp
        }
    }
}

print(arr)

/*
Time Complexity pf Bubble Sort 

    Worst - O(n^2) - when list is not sorted 
    Best - O(n) - when the list is already sorted

*/
