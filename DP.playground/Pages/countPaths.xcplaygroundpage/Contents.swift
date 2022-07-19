//: [Previous](@previous)

/**
 count paths - https://www.structy.net/problems/count-paths
 Write a function, countPaths, that takes in a grid as an argument. In the grid, 'X' represents walls and 'O' represents open spaces. You may only move down or to the right and cannot pass through walls. The function should return the number of ways possible to travel from the top-left corner of the grid to the bottom-right corner.

 const grid = [
   ["O", "O"],
   ["O", "O"],
 ];
 countPaths(grid); // -> 2
 
 const grid = [
   ["O", "O", "X"],
   ["O", "O", "O"],
   ["O", "O", "O"],
 ];
 countPaths(grid); // -> 5
 
 */
import Foundation
func countPaths(grid: [[String]]) -> Int {
    var memo = [String:Int]()
    return getPathCount(grid,0,0, &memo)
}

func getPathCount(_ grid: [[String]],_ r: Int,_ c:Int,_ memo:inout [String:Int]) -> Int {
    if let val = memo["\(r),\(c)"] {
        return val
    }
    if r == grid.count || c == grid[0].count {
        return 0
    }
    if grid[r][c] == "X" {
        return 0
    }
    if (r == grid.count - 1) && (c == grid[0].count - 1) {
        return 1
    }
    // as its given in problem that we can only move down and left
    let downPathCount = getPathCount(grid, r + 1, c, &memo)
    let leftPathCount = getPathCount(grid, r, c + 1, &memo)
    memo["\(r),\(c)"] = downPathCount + leftPathCount
    return memo["\(r),\(c)"]!
}
countPaths(grid: [["O", "O", "X"],["O", "O", "O"],["O", "O", "O"]])
