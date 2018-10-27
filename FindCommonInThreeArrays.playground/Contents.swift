//: Playground - noun: a place where people can play
// By Richa Srivastava
// https://www.youtube.com/watch?v=B6Tsrmgsy3k

import Foundation

let arr1 = [1,2,3,4,5,6,7]
let arr2 = [5,6,7,8,9,10]
let arr3 = [6,7,8,9,10,11,12]

func findCommon(a1:[Int],a2:[Int],a3:[Int]) -> [Int]{
    
    var x = 0
    var y = 0
    var z = 0
    var result = [Int]()
    
    while (x <= a1.count-1) && (y <= a2.count-1) && (z <= a3.count-1){
        if (a1[x] == a2[y]) && (a2[y] == a3[z]){
            result.append(a1[x])
            x = x + 1
            y = y + 1
            z = z + 1
        }else if a1[x] < a2[y] {
            x = x + 1
        }else if a2[y] < a3[z]{
            y = y + 1
        }else{
            z = z + 1
        }
    }
    return result
}

let res = findCommon(a1: arr1, a2: arr2, a3: arr3)
print(res)
