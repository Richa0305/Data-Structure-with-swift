//: [Previous](@previous)

import Foundation
import Darwin
/**
 minimum island
 Write a function, minimumIsland, that takes in a grid containing Ws and Ls. W represents water and L represents land. The function should return the size of the smallest island. An island is a vertically or horizontally connected region of land.

 You may assume that the grid contains at least one island.
 
 const grid = [
   ['W', 'L', 'W', 'W', 'W'],
   ['W', 'L', 'W', 'W', 'W'],
   ['W', 'W', 'W', 'L', 'W'],
   ['W', 'W', 'L', 'L', 'W'],
   ['L', 'W', 'W', 'L', 'L'],
   ['L', 'L', 'W', 'W', 'W'],
 ];

 minimumIsland(grid); // -> 2
 
 */
func minimumIsland(grid:[[String]]) -> Int {
    var minSize = 0
    var visited = Set<String>()
    for (rIndex, row) in grid.enumerated() {
        for (cIndex, _) in row.enumerated() {
            let size = traverse(grid: grid, row: rIndex, column: cIndex, visited: &visited)
            if size > 0 && minSize == 0 {
               minSize = size
            }
            if minSize > 0 && size != 0 {
                minSize = min(size, minSize)
            }
            
        }
    }
    
    return minSize
}

func traverse(grid: [[String]], row: Int, column: Int, visited: inout Set<String>) -> Int {
    guard row >= 0 && row < grid.count else {
        return 0
    }
    
    guard column >= 0 && column < grid[0].count else {
        return 0
    }
    
    if grid[row][column] == "W" {
        return 0
    }
    
    if visited.contains("\(row),\(column)") {
        return 0
    }
    visited.insert("\(row),\(column)")
    
    var size = 1
    size += traverse(grid: grid, row: row+1, column: column, visited: &visited)
    size += traverse(grid: grid, row: row-1, column: column, visited: &visited)
    size += traverse(grid: grid, row: row, column: column+1, visited: &visited)
    size += traverse(grid: grid, row: row, column: column-1, visited: &visited)
    
    return size
}
minimumIsland(grid: [
    ["W", "L", "W", "W", "W"],
    ["W", "L", "W", "W", "W"],
    ["W", "W", "W", "L", "W"],
    ["W", "W", "L", "L", "W"],
    ["L", "W", "W", "L", "L"],
    ["L", "L", "W", "W", "W"],
])
