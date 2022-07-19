//: [Previous](@previous)

import Foundation

/**
 max path sum - https://www.structy.net/problems/max-path-sum
 Write a function, maxPathSum, that takes in a grid as an argument. The function should return the maximum sum possible by traveling a path from the top-left corner to the bottom-right corner. You may only travel through the grid by moving down or right.

 You can assume that all numbers are non-negative.
 const grid = [
   [1, 3, 12],
   [5, 1, 1],
   [3, 6, 1],
 ];
 maxPathSum(grid); // -> 18
 */
func maxPathSum(grid: [[Int]]) -> Int {
    var memo = [String:Int]()
    return getMaxPathSum(grid,0,0, &memo)
}

func getMaxPathSum(_ grid: [[Int]],_ r: Int,_ c:Int,_ memo:inout [String:Int]) -> Int {
    if let val = memo["\(r),\(c)"] {
        return val
    }
    if r == grid.count || c == grid[0].count {
        return -1
    }
    
    if (r == grid.count - 1) && (c == grid[0].count - 1) {
        return grid[r][c]
    }
    // as its given in problem that we can only move down and left
    let downPathSum = getMaxPathSum(grid, r + 1, c, &memo)
    let leftPathSum = getMaxPathSum(grid, r, c + 1, &memo)
    memo["\(r),\(c)"] = grid[r][c] + max(downPathSum, leftPathSum)
    return memo["\(r),\(c)"]!
}
maxPathSum(grid: [[1, 3, 12],[5, 1, 1],[3, 6, 1]])
