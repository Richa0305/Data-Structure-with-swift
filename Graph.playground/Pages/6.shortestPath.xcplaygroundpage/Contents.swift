//: [Previous](@previous)

import Foundation

/**
 Write a function, shortestPath, that takes in an array of edges for an undirected graph and two nodes (nodeA, nodeB). The function should return the length of the shortest path between A and B. Consider the length as the number of edges in the path, not the number of nodes. If there is no path between A and B, then return -1.
 const edges = [
   ['w', 'x'],
   ['x', 'y'],
   ['z', 'y'],
   ['z', 'v'],
   ['w', 'v']
 ];

 shortestPath(edges, 'w', 'z'); // -> 2
 */

func shortestPath(edges:[[String]], nodeA: String, nodeB: String) -> Int {
    let graph = buildGraph(edges: edges)
    var queue = [ (nodeA, 0 )]
    var visited = Set<String>()
    visited.insert(nodeA)
    
    while !queue.isEmpty {
        let (current, distance) = queue.removeFirst()
        if current == nodeB {
            return distance
        }
        if let adjList = graph[current] {
            for item in adjList {
                if !visited.contains(item) {
                    visited.insert(item)
                    queue.append((item, distance + 1))
                }
            }
        }
    }
    
    
    return -1
}

func buildGraph(edges : [[String]]) -> Dictionary<String,[String]>{
    var graph = Dictionary<String, [String]>()
    for edge in edges {
        let v1 = edge[0]
        let v2 = edge[1]
        if var _ = graph[v1] {
            graph[v1]?.append(v2)
        } else {
            graph[v1] = [v2]
        }
        if var _ = graph[v2] {
            graph[v2]?.append(v1)
        } else {
            graph[v2] = [v1]
        }
        
    }
    return graph
}

shortestPath(edges: [ ["w", "x"],
                      ["x", "y"],
                      ["z", "y"],
                      ["z", "v"],
                      ["w", "v"]], nodeA: "w", nodeB: "z")
