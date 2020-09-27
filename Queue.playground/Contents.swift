/**
 
 Queue Data Structure

 A Queue is a structure in which whatever goes first comes out first.  In short FIFO - First In First Out.

 In Queue insertion or addition in queue must happen from one end that is called rear or tail of the queue, and any removal or deletion must happen from front or head of the queue.

 Operations of Queue -

 enQueue(x) or push(x) (Insertion)
 deQueue() Or pop (Deletion)
 front() on peek()
 isEmpty()

 Push and Pop are more famous in context of stack whereas enQueue and deQueue is more famous in context of Queue.

 All these operation must take O(1) time.

 Implementation of Queue -

 Array Based Implementation
 LinkedList Based Implementation

 */

// Array Implemantation

class Queue<T> {
    var arr = [T]()
    func enQueue(val: T) {
        arr.append(val)
    }
    func deQueue() -> T? {
        if arr.isEmpty {
            return nil
        } else {
            return arr.remove(at: 0)
        }
    }
}

var queue = Queue<String>()
queue.enQueue(val: "Hi")
queue.enQueue(val: "thr")
queue.deQueue()


// Linked List Implementation


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

