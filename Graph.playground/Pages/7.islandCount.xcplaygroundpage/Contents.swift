//: [Previous](@previous)

import Foundation

/**
 Write a function, islandCount, that takes in a grid containing Ws and Ls. W represents water and L represents land. The function should return the number of islands on the grid. An island is a vertically or horizontally connected region of land.

 const grid = [
   ["W", "L", "W", "W", "W"],
   ["W", "L", "W", "W", "W"],
   ["W", "W", "W", "L", "W"],
   ["W", "W", "L", "L", "W"],
   ["L", "W", "W", "L", "L"],
   ["L", "L", "W", "W", "W"],
 ];

 islandCount(grid); // -> 3
 
 */

func islandCount(grid: [[String]]) -> Int {
    
    var visited = Set<String>()
    var count = 0
    for (rIndex,row) in grid.enumerated() {
        for (cIndex,_) in row.enumerated() {
            if traverse(grid: grid, row: rIndex, column: cIndex, visited: &visited) {
                count += 1
            }
        }
    }
    
    return count
}

func traverse(grid: [[String]], row: Int, column: Int, visited: inout Set<String>) -> Bool {
    
    guard row >= 0 && row < grid.count else {
        return false
    }
    guard column >= 0 && column < grid[0].count else {
        return false
    }
    
    if grid[row][column] == "W" {
        return false
    }
    
    if visited.contains("\(row),\(column)") {
        return false
    }
    visited.insert("\(row),\(column)")
    
    traverse(grid: grid, row: row, column: column + 1, visited: &visited)
    traverse(grid: grid, row: row, column: column - 1, visited: &visited)
    traverse(grid: grid, row: row + 1, column: column, visited: &visited)
    traverse(grid: grid, row: row - 1, column: column, visited: &visited)
    
    
    return true
}
islandCount(grid: [
    ["W", "L", "W", "W", "W"],
    ["W", "L", "W", "W", "W"],
    ["W", "W", "W", "L", "W"],
    ["W", "W", "L", "L", "W"],
    ["L", "W", "W", "L", "L"],
    ["L", "L", "W", "W", "W"],
])
