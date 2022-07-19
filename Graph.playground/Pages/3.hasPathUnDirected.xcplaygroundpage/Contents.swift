//: [Previous](@previous)

import Foundation

/**
 Write a function, undirectedPath, that takes in an array of edges for an undirected graph and two nodes (nodeA, nodeB). The function should return a boolean indicating whether or not there exists a path between nodeA and nodeB.

 const edges = [
   ['i', 'j'],
   ['k', 'i'],
   ['m', 'k'],
   ['k', 'l'],
   ['o', 'n']
 ];

 undirectedPath(edges, 'j', 'm'); // -> true
 
 
 Since it is cyclic & directed graph we need to keep track of visited node else we will get stuck in cycle/infine loop
 
 */

func hasPathUndirected(edges : [[String]], nodeA: String, nodeB: String) -> Bool {
    let graph = buildGraph(edges: edges)
    print(graph)
    var visitedSet = Set<String>()
    return hasPathUndirectedGraph(graph: graph, src: nodeA, dest: nodeB, visited: &visitedSet)
}

func hasPathUndirectedGraph(graph: Dictionary<String,[String]>, src: String, dest: String, visited: inout Set<String>) -> Bool {
    if src == dest {
        return true
    }
    if visited.contains(src) {
        return false
    }
    visited.insert(src)
    if let adjList = graph[src] {
        for item in adjList {
            if hasPathUndirectedGraph(graph: graph, src: item, dest: dest, visited: &visited) {
                return true
            }
        }
    }
    
    
    return false
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

let edges = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["o", "n"]
  ]

print("===hasPath in Dicrected cyclic graph With BFS===")
hasPathUndirected(edges: edges, nodeA: "j", nodeB: "m")
print()

