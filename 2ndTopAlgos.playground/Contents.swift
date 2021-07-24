import Foundation
/**
 1st
 
 Search In Matrix :
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 */

func searchInMatrix(matrixArray: [[Int]], target: Int) -> Bool {
    var targetArr = [Int]()
    
    for arrs in matrixArray {
        if (target >= arrs[0]) && (target <= arrs[arrs.count-1]) {
            targetArr = arrs
        }
    }
    
    for item in targetArr {
        if item == target {
            return true
        }
    }
    return false
}

searchInMatrix(matrixArray:[[1,3,5,7],[10,11,16,20],[23,30,34,60]], target: 11)

/*
 2nd
 
 Shifting letters By k: Increment letters in string by k
 Ex- str - ABC, Shift by k= 2
 newStr = CDE
 */
//  ASCII value of the lowercase alphabet is from 97 to 122
//  ASCII value of the uppercase alphabet is from 65 to 90
func shiftLettersByk(str: String, k: Int) -> String {
    var newString = ""
    for char in str {
        if var charAscii = char.asciiValue, (charAscii >= 97) && (charAscii <= 122) {
            if (charAscii + UInt8(k)) == 122 {
                charAscii = 97 + UInt8(k - 1)
            } else {
                charAscii = charAscii + UInt8(k)
            }
            newString = newString + String(UnicodeScalar(UInt8(charAscii)))
        }
        if var charAscii = char.asciiValue, (charAscii >= 65) && (charAscii <= 90) {
            if charAscii + UInt8(k) == 90 {
                charAscii = 65 + UInt8(k - 1)
            } else {
                charAscii = charAscii + UInt8(k)
            }
            newString = newString + String(UnicodeScalar(UInt8(charAscii)))
        }
    }
    
    return newString
}
shiftLettersByk(str: "ABC", k: 24)


/**
 3rd
 
 Tree : Tree Implementation Swift
 */
class TreeNode {
    var value: Int
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    init(val: Int) {
        self.value = val
    }
}

// creating binary tree from an array
func binaryTreeFromArray(arr: [Int], firstIndex: Int, lastIndex: Int) -> TreeNode? {
    if lastIndex < firstIndex {
        return nil
    }
    let mid = (firstIndex + lastIndex)/2
    let node = TreeNode(val: arr[mid])
    node.leftNode = binaryTreeFromArray(arr: arr, firstIndex: firstIndex, lastIndex: mid - 1)
    node.rightNode = binaryTreeFromArray(arr: arr, firstIndex: mid + 1, lastIndex: lastIndex)
    return node
}

let arr = [2,3,4,5,6,7,8]
let node = binaryTreeFromArray(arr: arr, firstIndex: 0, lastIndex: arr.count - 1)
node?.value
node?.leftNode?.value
node?.rightNode?.value

/**
 5
 3                   7
 2               4     6             8
 */

var sum = 0
func sumNodesBetween(node: TreeNode, l:Int, r: Int) -> Int {
    if (r < l) && !(node.value > l) && !(node.value < r) {
        print("called")
        return 0
    }
    if (node.value >= l) && (node.value <= r) {
        print("called \(node.value)")
        if let leftNode = node.leftNode  {
            sum = sum + sumNodesBetween(node: leftNode, l: l, r: r)
        }
        if let rightNode = node.rightNode  {
            sum = sum + sumNodesBetween(node: rightNode, l: l, r: r)
        }
    }
    return sum
}
sumNodesBetween(node: node!, l: 3, r: 7)

func isValidBST(_ root: TreeNode?) -> Bool {
    return isBSTHelper(root, min: nil, max: nil)
}

func isBSTHelper(_ root: TreeNode?, min: Int?, max: Int?) -> Bool {
    guard let root = root else {
        return true
    }
    if let min = min, root.value <= min {
        return false
    }
    if let max = max, root.value >= max {
        return false
    }
    if isBSTHelper(root.leftNode, min: min, max: root.value) &&
        isBSTHelper(root.rightNode, min: root.value, max: max) {
        return true
    }
    return false
}
let tree = TreeNode(val: 2)
tree.leftNode = TreeNode(val: 1)
tree.rightNode = TreeNode(val: 3)
tree.value
tree.leftNode?.value
tree.rightNode?.value
var flag = isValidBST(tree)
print(flag)

/**
 4th
 
 Longest substring : Given a string s, find the length of the longest substring without repeating characters.
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */
print("==========Sliding window approach =======")
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else { return s.count }
    var highestCount = 0
    var currentSubstring  = [Character]()
    for char in s {
        print(currentSubstring)
        
        if let index = currentSubstring.firstIndex(of: char) {
            print("remove at \(index + 1)")
            currentSubstring.removeFirst(index + 1)
        }
        currentSubstring.append(char)
        highestCount = max(highestCount, currentSubstring.count)
        print(currentSubstring)
        print("=== loop 1 ===")
    }
    return highestCount
}


/**
 5th
 
 Merge two sorted arrays
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 */

func mergeSortedArray(arr1: [Int], arr2: [Int]) -> [Int]{
    var arr3 = [Int]()
    var i: Int = 0, j: Int = 0
    while i < arr1.count && j < arr2.count {
        if arr1[i] <= arr2[j] {
            arr3.append(arr1[i])
            i = i + 1
        } else {
            arr3.append(arr2[j])
            j = j + 1
        }
        
    }
    if i < arr1.count {
        while i < arr1.count {
            arr3.append(arr1[i])
            i = i + 1
        }
    }
    if j < arr2.count {
        while j < arr2.count {
            arr3.append(arr2[j])
            j = j + 1
        }
    }
    return arr3
}

let sortedMergedArray = mergeSortedArray(arr1: [2,1,5], arr2: [5,3,8])
sortedMergedArray

/**
 Merge two sorted List :
 */




func findCompletePrefixes(names: [String], query: [String]) -> [Int] {
    var queryVals = Array(repeating: 0, count: query.count)
    var namesDict = [String:Int]()
    for (index, name) in names.enumerated() {
        namesDict[name] = index
    }
    for (index,q) in query.enumerated() {
        let results = namesDict.flatMap { (key, value) in (key.contains(q) && key != q) ? value : nil }

        print(results)
    }
    
    
//    for (index,q) in query.enumerated() {
//        queryVals[index] = 0
//        for name in names {
//            if name.contains(q) && name != q {
//                queryVals[index] = queryVals[index] + 1
//            }
//        }
//    }
//
    return queryVals
}

//findCompletePrefixes(names: ["steve","stevens","danny","steves","dan","john","johnny","joe","alex","alexander"], query: ["steve","alex","joe","john","dan"])


func minimizeBias(ratings: [Int]) -> Int {
    var bias = [Int]()
    var biasAmount = 0
    for i in 0...ratings.count {
        for j in 0...ratings.count {
            biasAmount = -1
            if i != j {
                if (biasAmount != -1) && (biasAmount > abs(ratings[j] - ratings[i])){
                    biasAmount = abs(ratings[j] - ratings[i])
                }
            }
            bias.append(biasAmount)
        }
    }
    
    return biasAmount
}
minimizeBias(ratings: [1,3,6,6])


enum APIEnvironment: String {
    case development
    case staging
    case production
}

APIEnvironment.production.rawValue

func foo() {
    DispatchQueue.global().sync {
        
        for i in 0...10 {
            print (i)
        }
    }
    
    DispatchQueue.global().sync {
        
        for i in 11...20 {
            print (i)
        }
    }
}
foo()

DispatchQueue.global().async {
    print("hiiii")
    DispatchQueue.global().sync {
        print("hello")
    }
    print("whatsever")
}
let queue = DispatchQueue(label: "myqueue")
queue.sync {
    queue.async {
        // outer block is waiting for this inner block to complete
        // inner block won’t start before outer block finishes
        // hanse -> DEADLOCK
        print(" myqueue hello")
    }
    print(" myqueue hiiiii")
    // this will never be reached
}


func longestPalindrome(_ s: String) -> String {
    var substringDict = [String:Int]()
    
    for char in s {
        
    }
    
    
    return ""
}

func isPalindrom(_ s:String) -> Bool {
    if(s.count <= 1) {
        return true
    }
    let sArr = Array(s)
    var first = 0
    var last = sArr.count - 1
    
    while first < last {
        if !isAlphaNumaric(char: sArr[first]) {
            first += 1
            continue
        }else if !isAlphaNumaric(char: sArr[last]) {
            last -= 1
            continue
        }
      
        if sArr[first].lowercased() != sArr[last].lowercased() {
            return false
        }
        
        first += 1
        last -= 1
    }
    return true
}
func isAlphaNumaric(char: Character) -> Bool{
    return char.isLetter || char.isNumber
  
}
isPalindrom("A man, a plan, a canal: Panama")
longestPalindrome("babad")
