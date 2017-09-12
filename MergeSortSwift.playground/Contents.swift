//: Merge Sort By Richa Srivastava
/*
Merge sort is a sorting algorithm with a simple strategy: divide and conquer.

The steps for merge sort are simple:

1. Split the unsorted array containing N elements into N arrays containing one element each
2. Merge the piles together by sequentially pairing piles together in sorted order
*/

import UIKit

let unsortedArray = [7, 2, 6, 3, 9, 4]


// Step 1 : Split the Array
func mergeSort(arr:[Int]) -> [Int]{

    guard arr.count > 1 else {
        return arr
    }
    
  let midIndex = arr.count/2
  let leftArray = mergeSort(arr: Array(arr[0..<midIndex]))
  let rightArray = mergeSort(arr: Array(arr[midIndex..<arr.count]))
    
    return merge(left: leftArray, right: rightArray)
}

//  Step 2 :Conqure/merge the splited array
func merge(left:[Int],right:[Int]) -> [Int]{
    var leftIndex = 0
    var rightIndex = 0
    
    var orderArr : [Int] = []
    while leftIndex < left.count && rightIndex < right.count{
        if (left[leftIndex] < right[rightIndex]){
            orderArr.append(left[leftIndex])
            leftIndex += 1
        }else if (right[rightIndex] < left[leftIndex]){
            orderArr.append(right[rightIndex])
            rightIndex += 1
        }else{
            orderArr.append(left[leftIndex])
            leftIndex += 1
            orderArr.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count{
        orderArr.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
            orderArr.append(right[rightIndex])
            rightIndex += 1
    }
    return orderArr
}
let sortedArr = mergeSort(arr: unsortedArray)

/*
Time Complexity of Merge Sort 

    Best - O(n log(n))
    Worst - O(n log(n))
    Avg - O(n log(n))
*/
