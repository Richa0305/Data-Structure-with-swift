//: Playground - noun: a place where people can play
//: Merge Sort By Richa Srivastava
import Foundation

class MergeSortAlgo{

func MergeSort(Arr:Array<Int>){

let Arr = [7,3,4,2,1,5,6]
    let n = Arr.count
    if (n<2){
        return;
    }
    let mid = n/2
    var left = Array<Int>()
    var right = Array<Int>()
    for i in 0..<(mid-1){
        left[i] = Arr[i]
    }
    for i in mid..<(n-1){
        right[i] = Arr[i]
    }
    print(left)
    print(right)
    
}

func Merge(Left:Array<Int>,Right:Array<Int>,A:Array<Int>){
    let nL = Left.count;
    let nR = Right.count;
    var i = 0
    var j = 0
    var k = 0
    var Arr = A
    while (( i < nL ) && ( j < nR )){
        if(Left[i] <= Right[j]){
            Arr[k] = Left[i]
            i = i+1
        }else{
            Arr[k] = Right[j]
            j = j+1
        }
            k = k+1
    }
    while (i<nL){
        Arr[k] = Left[i]
        k=k+1
        i=i+1
    }
    while (j<nR){
        Arr[k] = Right[j]
        k=k+1
        j=j+1
    }
}
}

let arr = [7,3,4,2,1,5,6]
var mergeSort = MergeSortAlgo()
mergeSort.MergeSort(Arr: arr)