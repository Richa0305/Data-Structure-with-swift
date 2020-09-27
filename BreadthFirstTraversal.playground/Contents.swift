/**
 
 Breadth First Or Level Order Traversal - We can use queue for this traversal. As we visit the node we can keep reference or address of all its children in a queue so that we can visit them later.

 A node in a queue can be called discovered node whose address is known to us but we have not visited yet. Initially we can start with root node. We store the address of the root node in queue. As long as queue is not empty, we can take out the node and visit it and enqueue its children’s, and we repeat this for all the nodes.
 
 Space Complexity - O(h) // h is height of tree
     best case - O(1)
     worst/avg case - O(n)

 Time Complexity - O(n)

 */



// Linked List Implementation of Queue


class LLQueue<T> {
    var data: T
    var next: LLQueue?
    init(val: T) {
        data = val
    }
}


class LLQueueImp<T> {
    var head: LLQueue<T>?
    var front: LLQueue<T>? { return head }
    var rear: LLQueue<T>? {
        var node:LLQueue<T>? = self.head
        while (node?.next != nil) {
            node = node?.next
        }
        return node
    }
    
    func enQueue(val: T) {
        let newNode =  LLQueue(val: val)
        if let lastNode = rear {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func deQueue() -> T? {
        if head == nil {
            return nil
        }
        let temp = head
        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
        }
        return temp?.data
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    func isEmpty() -> Bool {
        return (head == nil) ? true : false
    }
}


var llQueue = LLQueueImp<Int>()
llQueue.enQueue(val: 1)
llQueue.enQueue(val: 2)
llQueue.deQueue()
llQueue.peek()


// Breadth First Traversal

class Node {
    var data: Int
    var leftNode: Node?
    var rightNode: Node?
    init(data: Int) {
        self.data = data
    }
}

func breadthFirstTraversal(root: Node) {
    let queue = LLQueueImp<Node>()
    queue.enQueue(val: root)
    while !(queue.isEmpty()) {
        let currentTop = queue.peek()
        print(currentTop?.data ?? 0)
        if let left = root.leftNode {
            queue.enQueue(val: left)
        }
        if let right = root.rightNode {
            queue.enQueue(val: right)
        }
        queue.deQueue()
    }
}
