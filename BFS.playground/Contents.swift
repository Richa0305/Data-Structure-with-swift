import UIKit
class Node{
    var value: Int!
    var visited : Bool?
    var neighbors: [Edge]?
    init(value:Int) {
        self.value = value
        self.visited = false
        self.neighbors = []
    }
}
class Edge{
    var neighbor: Node?
    init(_ neighbor: Node) {
        self.neighbor = neighbor
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
            return array.removeFirst()
        }
    }
}

class Graph {
    var nodes:[Node]?
    init() {
        self.nodes = []
    }
    func addNode(_ value: Int) -> Node {
        let node = Node(value: value)
        self.nodes?.append(node)
        return node
    }
    
    public func addEdge(_ source: Node, neighbor: Node) {
        let edge = Edge(neighbor)
        source.neighbors?.append(edge)
    }
}



//              1
//          /  \  \ \
//        2     3  4 5
//          \  / \ | |
//            6   7  8
let graph = Graph()

let node1 = graph.addNode(1)
let node2 = graph.addNode(2)
let node3 = graph.addNode(3)
let node4 = graph.addNode(4)
let node5 = graph.addNode(5)
let node6 = graph.addNode(6)
let node7 = graph.addNode(7)
let node8 = graph.addNode(8)

graph.addEdge(node1, neighbor: node2)
graph.addEdge(node1, neighbor: node3)
graph.addEdge(node1, neighbor: node4)
graph.addEdge(node1, neighbor: node5)
graph.addEdge(node2, neighbor: node6)
graph.addEdge(node3, neighbor: node6)
graph.addEdge(node3, neighbor: node7)
graph.addEdge(node4, neighbor: node7)
graph.addEdge(node5, neighbor: node8)

func breadthFirstSearch(_ graph: Graph, source: Node) -> [Int] {
    var queue = Queue<Node>()
    queue.enqueue(source)
    
    var nodesExplored = [source.value]
    source.visited = true
    
    while let node = queue.dequeue() {
        for edge in node.neighbors! {
            let neighborNode = edge.neighbor
            if !neighborNode!.visited! {
                queue.enqueue(neighborNode!)
                neighborNode!.visited = true
                nodesExplored.append(neighborNode?.value)
            }
        }
    }
    
    return nodesExplored as! [Int]
}
print(breadthFirstSearch(graph, source: node1))
