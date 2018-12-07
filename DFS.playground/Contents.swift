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

var possiblePaths = [Int]()
var possiblePathsArray = [[Int]]()
func findAllPossiblePaths(_ graph: Graph, source: Node) -> [[Int]]{
    for edge in source.neighbors! {
        if !(possiblePaths.contains(source.value)){
            possiblePaths.append(source.value)
        }
        possiblePaths.append(edge.neighbor?.value ?? 0)
        _ = findAllPossiblePaths(graph, source: edge.neighbor!)
    }
    if possiblePaths.count > 0 {
        possiblePathsArray.append(possiblePaths)
    }
    possiblePaths.removeAll()
    return possiblePathsArray
}

func depthFirstSearch(_ graph: Graph, source: Node?) -> [Int?] {
    var nodesExplored = [source?.value]
    source?.visited = true
    
    for edge in (source?.neighbors!)! {
        if !edge.neighbor!.visited! {
            nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
        }
    }
    return nodesExplored
}

let dfs = depthFirstSearch(graph, source: node1)
print(dfs.map( { $0! } ))

print(findAllPossiblePaths(graph, source: node1))
