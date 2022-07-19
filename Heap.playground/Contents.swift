
//
//  Recursion.swift
//
//
//  Created by richa.e.srivastava on 09/03/2022.
//

import Foundation

/**
 https://www.youtube.com/watch?v=hW8PrQrvMNc&list=PL_z_8CaSLPWdtY9W22VjnPxG30CXNZpI9
 
 Heap - Max Heap & Min Heap
 
 Implemented with stack
 
 Problem can contain -
 
 k smallest or largest
 
 if asking for smallest then make max heap
 if asking for lasgest then make min heap
 
 **/
import Foundation


// fine kth smallest element

struct MinHeap<T: Comparable> {
  var items = [T]()
    private func getLeftChildIndex(n: Int) -> Int {
      return (2*n) + 1
    }
    private func getRightChildIndex(n: Int) -> Int {
      return (2*n) + 2
    }
    private func getParentIndex(n: Int) -> Int {
      return (n - 1) / 2
    }
    // 1
    private func leftChild(index: Int) -> T {
      return items[getLeftChildIndex(n: index)]
    }
    // 2
    private func rightChild(index: Int) -> T {
      return items[getRightChildIndex(n: index)]
    }
    // 3
    private func parent(index: Int) -> T {
      return items[getParentIndex(n: index)]
    }
    public func peek() -> T? {
      guard items.count > 0 else {
        return nil
      }
      return items[0]
    }
    public mutating func add(item: T) {
      // 1
      items.append(item)

      // 2
      var lastIndex = items.count - 1
      // 3
      while parent(index: lastIndex) > items[lastIndex] {
          // 4
          items.swapAt(getParentIndex(n: lastIndex), lastIndex)
          // 5
          lastIndex = getParentIndex(n: lastIndex)
      }
    }
}
func findkthSmallest(arr: [Int], k : Int) -> Int {
    var smallest = 0
    var stack = [Int]()
    var minHeap = MinHeap<Int>()
    for (index,item) in arr.enumerated() {
        minHeap.add(item: item)
        if minHeap.items.count > k
        {
           // minHeap.items.removeLast()
        }
        
    }
    print(minHeap)
    return minHeap.items.last ?? 0
}


findkthSmallest(arr: [7,10,6,3,4,9], k: 3)
// 3 4 6 7 9 10
