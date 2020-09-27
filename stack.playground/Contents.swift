/**
 
Stack Data Structure

A stack is a structure in which whatever goes first comes out last.  In short LIFO - Last In First Out.

In Stack insertion or addition, must happen from same end that is called top of a stack.

Operations -

push(x) (Insertion)
pop (Deletion)
peek()
isEmpty()
 
All these operation must take O(1) time.
 
 Implementation of Stack -

 Array Based Implementation
 LinkedList Based Implementation 
 
 
 */


// Array Based Implementation
class Stack<Element> {

    var stackArray = [Element]()
    func  push(val: Element)  {
        stackArray.append(val)
    }
    func pop() -> Element? {
        return stackArray.removeLast()
    }
    func peek() -> Element? {
        return stackArray.last
    }
}


var stack = Stack<String>()
stack.push(val: "Hi")
stack.push(val: "This")
stack.push(val: "is")
stack.push(val: "Great")
stack.pop()
stack.peek()


// Linked List Based Implemention

class LLStack<T> {
    var value: T
    var next: LLStack?
    init(val: T) {
        value = val
    }
}

class LLStackImplementation<T> {
    var headNode: LLStack<T>?
    
    func pushInStack(val: T) {
        let newNode = LLStack(val: val)
        if headNode == nil {
            headNode = newNode
        } else {
            let oldHeadNode = headNode
            headNode = newNode
            newNode.next = oldHeadNode
        }
    }
    
    func popFromStack() -> T? {
        let currentTop = headNode
        if headNode?.next != nil {
            headNode = headNode?.next
        } else {
            headNode = nil
        }
        return currentTop?.value
    }
    
    func peek() -> T? {
        return headNode?.value
    }
}


var llstack = LLStackImplementation<String>()
llstack.pushInStack(val: "Hi")
llstack.pushInStack(val: "My")
llstack.pushInStack(val: "Name")
llstack.pushInStack(val: "is")
llstack.pushInStack(val: "Nobita")
llstack.popFromStack()
llstack.peek()
llstack.popFromStack()
