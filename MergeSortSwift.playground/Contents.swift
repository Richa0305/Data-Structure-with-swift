//: Merge Sort By Richa Srivastava
/*
Merge sort is a sorting algorithm with a simple strategy: divide and conquer.

The steps for merge sort are simple:

1. Split the unsorted array containing N elements into N arrays containing one element each
2. Merge the piles together by sequentially pairing piles together in sorted order
*/

// First Step : Split Array of N element in N Arrays 
func mergeSort(arr : [Int]) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    let leftArray = arr[0..<arr.count/2]
    let rightArray = arr[arr.count/2..<arr.count]

    
    return merge(left: mergeSort(arr: Array(leftArray)), right: mergeSort(arr: Array(rightArray)))
}

// Second Step : Merge the arrays in sorted order
func merge (left: [Int], right: [Int]) -> [Int]{
    
    var mergedArr = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if (left.first! < right.first!) {
            mergedArr.append(left.removeFirst())
        } else {
            mergedArr.append(right.removeFirst())
        }
    }
    return mergedArr + left + right
    
}

var arr = [8,9,7,6,5,8,7,0]
print(mergeSort(arr: arr))
/*
Time Complexity of Merge Sort 

    Best - O(n log(n))
    Worst - O(n log(n))
    Avg - O(n log(n))
*/
