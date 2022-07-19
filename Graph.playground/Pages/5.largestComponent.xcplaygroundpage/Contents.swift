//: [Previous](@previous)

import Foundation

/**
 Write a function, largestComponent, that takes in the adjacency list of an undirected graph. The function should return the size of the largest connected component in the graph.
 
 largestComponent(graph: [
     0: [8, 1, 5],
      1: [0],
      5: [0, 8],
      8: [0, 5],
      2: [3, 4],
      3: [2, 4],
      4: [3, 2]
 ])  -> 4
 
 */

func largestComponent(graph: Dictionary<Int,[Int]>) -> Int {
    var size = 0
    var visited = Set<Int>()
    for (_,key) in graph.keys.enumerated() {
        let currentNodeSize = getCurrentNodeSize(graph: graph, node: key, visited: &visited)
        if currentNodeSize > 0 && currentNodeSize > size {
            size = currentNodeSize
        }
    }
    return size
}

func getCurrentNodeSize(graph: Dictionary<Int,[Int]>, node: Int, visited: inout Set<Int>) -> Int {
    if visited.contains(node) {
        return 0
    }
    visited.insert(node)
    var size = 1
    if let adjList = graph[node] {
        for item in adjList {
            size += getCurrentNodeSize(graph: graph, node: item, visited: &visited)
        }
    }
    
    return size
    
}
largestComponent(graph: [
    3: [],
    4: [6],
    6: [4, 5, 7, 8],
    8: [6],
    7: [6],
    5: [6],
    1: [2],
    2: [1]
])
