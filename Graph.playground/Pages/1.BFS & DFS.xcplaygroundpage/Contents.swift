import UIKit

// https://www.youtube.com/watch?v=tWVWeAqZ0WU

// DFS Iterative approach with stack
func depthFirstSearch(graph: Dictionary<String, [String]>, source: String) {
    var stack = [source]
    while stack.count > 0 {
        let current = stack.removeLast()
        print(current)
        if let list = graph[current] {
            for val in list {
                stack.append(val)
            }
        }
        
    }
}

// DFS Recursive approach with inbuilt call stacks of recursive calls
func dfsRecur(graph: Dictionary<String, [String]>, source: String) {
    print(source)
    if let neighbors = graph[source] {
        for item in neighbors {
            dfsRecur(graph: graph, source: item)
        }
    }
}

// BFS Iterative approach with queue, this cant be implemented with recursion as recursion uses stack for recursive calls
func breadthFirstSearch(graph: Dictionary<String,[String]>, source: String) {
    var queue = [source]
    while !queue.isEmpty {
        let current = queue.removeFirst()
        print(current)
        if let list = graph[current] {
            for item in list {
                queue.append(item)
            }
        }
    }
}





let graph = [
    "a" : ["b", "c"],
    "b" : ["d"],
    "c" : ["e"],
    "d" : ["f"],
    "e" : [],
    "f" : []
]
print("===DFS Iterative Approcah===")
depthFirstSearch(graph: graph, source: "a")
print()

print("===DFS Recusive Approcah===")
dfsRecur(graph: graph, source: "a")
print()

print("===BFS===")
breadthFirstSearch(graph: graph, source: "a")
print()
