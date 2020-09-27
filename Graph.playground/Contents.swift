import UIKit

// Graph Adjacency List - with Dictionary of Arrays


import UIKit
class Vertex<T>{
    var value: T
    var visited : Bool?
    var neighbours: [Edge<T>]?
    init(value:T) {
        self.value = value
        self.visited = false
        self.neighbours = []
    }
}
class Edge <T>{
    var neighbour: Vertex<T>?
    init(_ neighbour: Vertex<T>) {
        self.neighbour = neighbour
    }
}

public struct Queue<T> {
    private var array: [T]
    public init() {
        array = []
    }
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    public mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
}

public struct Stack<T> {
    public var array : [T]
    public init() {
        array = []
    }
    public mutating func push(element: T) {
        array.append(element)
    }
    public mutating func pop() -> T? {
        return array.removeFirst()
    }
    
    public mutating func isEmpty() -> Bool {
        return array.isEmpty
    }
}

class Graph<T> {
    var vertices:[Vertex<T>]?
    init() {
        self.vertices = []
    }
    func addVertex(_ value: T) -> Vertex<T> {
        let vertex = Vertex(value: value)
        self.vertices?.append(vertex)
        return vertex
    }
    
    public func addEdge(_ source: Vertex<T>, neighbour: Vertex<T>) {
        let edge = Edge(neighbour)
        source.neighbours?.append(edge)
    }
}



//              1
//          /  \  \ \
//        2     3  4 5
//          \  / \ | |
//            6   7  8
let graph = Graph<Int>()

let node1 = graph.addVertex(1)
let node2 = graph.addVertex(2)
let node3 = graph.addVertex(3)
let node4 = graph.addVertex(4)
let node5 = graph.addVertex(5)
let node6 = graph.addVertex(6)
let node7 = graph.addVertex(7)
let node8 = graph.addVertex(8)

graph.addEdge(node1, neighbour: node2)
graph.addEdge(node1, neighbour: node3)
graph.addEdge(node1, neighbour: node4)
graph.addEdge(node1, neighbour: node5)
graph.addEdge(node2, neighbour: node6)
graph.addEdge(node3, neighbour: node6)
graph.addEdge(node3, neighbour: node7)
graph.addEdge(node4, neighbour: node7)
graph.addEdge(node5, neighbour: node8)

func breadthFirstSearch(source: Vertex<Int>) -> [Int] {
    var queue = Queue<Vertex<Int>>()
    queue.enqueue(source)
    var verticesExplored = [source.value]
    source.visited = true
    while let vertex = queue.dequeue() {
        for edge in vertex.neighbours! {
            let neighbourVertex = edge.neighbour
            if !neighbourVertex!.visited! {
                queue.enqueue(neighbourVertex!)
                neighbourVertex!.visited = true
                verticesExplored.append(neighbourVertex!.value)
            }
        }
    }
    return verticesExplored
}


func depthFirstSearch(source: Vertex<Int>) -> [Int] {
    var nodesExplored = [source.value]
    source.visited = true
    
    for edge in (source.neighbours!) {
        if !edge.neighbour!.visited! {
            nodesExplored += depthFirstSearch(source: edge.neighbour!)
        }
    }
    return nodesExplored
}
print(depthFirstSearch(source: node1))
