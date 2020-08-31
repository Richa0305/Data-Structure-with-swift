
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
stack.push(val: "Richa")
stack.push(val: "Goi")
stack.push(val: "Shau")
stack.push(val: "Gammu")
stack.push(val: "Dibu")
print(stack.pop())
print(stack.peek())


class StackLinkedList {
    var value: String
    var next: StackLinkedList?
    init(val: String) {
        value = val
    }
}

var headNode: StackLinkedList?
func pushInStack(val: String) {
    let oldHeadNode = headNode
    headNode = StackLinkedList(val: val)
    headNode?.next = oldHeadNode
    
}

func popFromSatck() -> String? {
    let currentNode = headNode
    headNode = headNode?.next
    return currentNode?.value
}



pushInStack(val: "Hi")
pushInStack(val: "My")
pushInStack(val: "Name")
pushInStack(val: "is")
pushInStack(val: "Richa")

print("pop ===")
popFromSatck()
popFromSatck()
popFromSatck()
popFromSatck()
popFromSatck()
