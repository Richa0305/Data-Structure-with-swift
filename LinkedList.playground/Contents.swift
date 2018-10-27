import UIKit

/*
 A linked list is a dynamic data structure where number of data is not fixed(like array) and can grow or shrink based on demand.
 Each node in link list consist of two things –
 -  Data
 -  Link to next node
 */

class Node{
    let value : Int
    var next : Node?
    
    init(val : Int, next: Node?) {
        self.value = val
        self.next = next
    }
}
// 7
// 1->2->3->4->5->nil
let fifthNode = Node(val: 5, next: nil)
let fourthNode = Node(val: 4, next: fifthNode)
let thirdNode = Node(val: 3, next: fourthNode)
let secondNode = Node(val: 2, next: thirdNode)
let firstNode = Node(val: 1, next: secondNode)


/*  Print a linked list */
func printLinkedList(headNode: Node?){
    var currentNode = headNode
    print("Printing Linked List")
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}

/*  insert a new node in linked list */
func insertNodeLinkedList(prev_node:Node?,new_value:Int){
    if prev_node == nil {
        return
    }
    let new_node = Node(val: new_value, next: prev_node?.next)
    prev_node?.next = new_node
    
}

/*  Reverse a linked list */
func reverseLinkedList(head:Node?) -> Node?{
    var currentNode = head
    var prev:Node?
    var next:Node?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        prev = currentNode
        currentNode = next
    }
    
    return prev
}
/*
 Traverse the whole linked list and count the no. of nodes. Now traverse the list again till count/2 and return the node at count/2.
 */
func getMiddleMethod1(head:Node?) -> Node?{
    var currentNode = head
    let listLength = getListLength(head: currentNode)
    var mid = listLength/2
    while (mid > 0) && (currentNode != nil) {
        currentNode = currentNode?.next
        mid = mid - 1
    }
    
    return currentNode
}


/*
 Traverse linked list using two pointers. Move one pointer by one and other pointer by two. When the fast pointer reaches end slow pointer will reach middle of the linked list.
 */
func getMiddleMethod2(head:Node?) -> Node?{
    var slowNode = head
    var fastNode = head
    
    while (fastNode != nil) && (fastNode?.next != nil) {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    
    
    return slowNode
}


/*  Get length of the linked list */
func getListLength(head:Node?) -> Int{
    var currentNode = head
    var count = 0
    while currentNode != nil {
        count = count + 1
        currentNode = currentNode?.next
    }
    return count
}

/*
 Traverse the list from the head (or start) node. While traversing, compare each node with its next node. If data of next node is same as current node then delete the next node. Before we delete a node, we need to store next pointer of the node
 */
func removeDuplicateNodesFromLinkedList(head:Node?){
    var current = head
    var temp_next:Node?
    
    while current?.next != nil {
        if current?.value == current?.next?.value {
            temp_next = current?.next?.next
            current?.next = temp_next
        }else{
            current = current?.next
        }
    }
}

/*
 First Aproach -
 1) Calculate the length of Linked List. Let the length be len.
 2) Print the (len – n + 1)th node from the begining of the Linked List.
 
 Second Aproach -
 Maintain two pointers – reference pointer and main pointer. Initialize both reference and main pointers to head. First move reference pointer to n nodes from head. Now move both pointers one by one until reference pointer reaches end. Now main pointer will point to nth node from the end. Return main pointer.
 */
func findNthNodeFromEnd(head:Node?,n:Int) -> Node?{
    var main_ptr = head
    var ref_ptr = head
    var count = 0
    if head != nil {
        while count < n {
            if ref_ptr != nil {
                ref_ptr = ref_ptr?.next
                count = count + 1
            }
        }
        // ref_ptr -> will point to nth from begining
        while  ref_ptr != nil {
            main_ptr = main_ptr?.next
            ref_ptr = ref_ptr?.next
        }
        // main_ptr will have nth node from end
    }
    
    return main_ptr
}

//1
printLinkedList(headNode: firstNode)

//2
print("===Add New Node====")
insertNodeLinkedList(prev_node: fourthNode, new_value: 4)

//3
print("===Reverse Linked List====")
let reversedList = reverseLinkedList(head: firstNode)
printLinkedList(headNode: reversedList)

//4
print("===Get Middle Node====")
let midNode = getMiddleMethod1(head: fifthNode)
print("Middle Node by method 1 - \(midNode?.value ?? 0)")

let midNode2 = getMiddleMethod2(head: fifthNode)
print("Middle Node by method 2- \(midNode2?.value ?? 0)")

//5
print("===Remove Duplicates====")
removeDuplicateNodesFromLinkedList(head: fifthNode)
printLinkedList(headNode: fifthNode)


//5
print("===Print nth node from end====")
let nthNode = findNthNodeFromEnd(head: fifthNode, n: 3)
print(nthNode?.value ?? 0)
