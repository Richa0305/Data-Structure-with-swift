//: [Previous](@previous)

import Foundation

// check for path in a directed & acyclic graph
/**
 Write a function, hasPath, that takes in an object representing the adjacency list of a directed acyclic graph and two nodes (src, dst). The function should return a boolean indicating whether or not there exists a directed path between the source and destination nodes.
 */

func hasPath(graph: Dictionary<String,[String]>, src: String, dest: String) -> Bool {
    var queue = [src]
    while !queue.isEmpty {
        let current = queue.removeFirst()
        if current == dest {
            return true
        }
        if let adjList = graph[current] {
            for item in adjList {
                queue.append(item)
            }
        }
    }
    return false
}

func hasPathRecusive(graph: Dictionary<String,[String]>, src: String, dest: String) -> Bool {
    
    if src == dest {
        return true
    }
    if let adjList = graph[src] {
        for item in adjList {
            if hasPathRecusive(graph: graph, src: item, dest: dest) {
                return true
            }
        }
    }
    
    return false
}


let graph = [
    "a" : ["b", "c"],
    "b" : ["d"],
    "c" : ["e"],
    "d" : ["f"],
    "e" : [],
    "f" : []
]

print("===hasPath in Dicrected Acyclic graph With BFS===")
hasPath(graph: graph, src: "b", dest: "f")
print()

print("===hasPath in Dicrected Acyclic graph With DFS===")
hasPathRecusive(graph: graph, src: "b", dest: "f")
print()

