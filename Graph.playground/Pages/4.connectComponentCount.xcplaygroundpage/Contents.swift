//: [Previous](@previous)

import Foundation

/**
 Write a function, connectedComponentsCount, that takes in the adjacency list of an undirected graph. The function should return the number of connected components within the graph.

 connectedComponentsCount({
   0: [8, 1, 5],
   1: [0],
   5: [0, 8],
   8: [0, 5],
   2: [3, 4],
   3: [2, 4],
   4: [3, 2]
 }); // -> 2
 
 */

func connectedComponentsCount(graph: Dictionary<Int,[Int]>) -> Int {
    var visisted = Set<Int>()
    var count = 0
    
    for (_,key) in graph.keys.enumerated() {
        if traverse(graph: graph, node: key, visited: &visisted) {
            count += 1
        }
    }
    
    return count
}

func traverse(graph: Dictionary<Int,[Int]>, node: Int ,visited: inout Set<Int>) -> Bool {
    if visited.contains(node) {
        return false
    }
    visited.insert(node)
    if let adjList = graph[node] {
        for item in adjList {
            traverse(graph: graph, node: item, visited: &visited)
        }
    }
    return true
}
connectedComponentsCount(graph:  [
    3: [],
     4: [6],
     6: [4, 5, 7, 8],
     8: [6],
     7: [6],
     5: [6],
     1: [2],
     2: [1]
                    ])
