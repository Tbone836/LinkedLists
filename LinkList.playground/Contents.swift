import UIKit

//This class is for a one node that will go into the Double Linked List
class SingleNode{
    //These are parameters. It needs to know the next and previous nodes to find its position. It also needs a value.
    var next: SingleNode?
    var prev: SingleNode?
    var val: Int?
    
    
    init(next: SingleNode?, prev: SingleNode?, val:Int?){
        
        //This is where the variables exist.
        self.next = next
        self.prev = prev
        self.val = val
        
    }
}
//Creating the class of the double linked list
class DoubleLinkedList{
    //These are parameters for the list. Count: Length of the Double Linked List. Header: Starting Node. Trailer: Ending Node
    var count: Int
    var header: SingleNode
    var trailer: SingleNode
    init(){
        //How many other nodes there are other than the header and trailer
        count = 0
        //Creating the header node
        header = SingleNode(next: nil, prev: nil, val: nil)
        //Creating the trailer node
        trailer = SingleNode(next: nil, prev: nil, val: nil)
        //This is assigning the relationship between the two nodes.
        self.header.prev = self.trailer
        self.trailer.next = self.header
    }
    func _len_() -> Int{
        //No parameters. It just returns the number of nodes in the double linekd list other than the header and trailer
        return self.count
    }
    func is_empty() -> Bool{
        //No parameters. It returns true or false based on if there are nodes other than the header and the trailer.
        return self.count == 0
    }
    func insert_between(beforeNode: SingleNode?, afterNode: SingleNode?, value: Int?) -> SingleNode?{
        //Parameters: Two single nodes and an integer
        //Creates a newNode that gets its position and the value.
        let newNode = SingleNode(next: afterNode, prev: beforeNode, val: value)
        //These create the connections between the new node and the before and after nodes.
        afterNode?.prev = newNode
        newNode.next = afterNode
        beforeNode?.next = newNode
        newNode.prev = beforeNode
        //Since there is a new node, there is one more so the count is increased.
        count += 1
        return newNode
    }
    func delete_node(beingDeletedNode: SingleNode?) -> Int?{
        let beforeNode = beingDeletedNode?.prev
        let afterNode = beingDeletedNode?.next
        afterNode?.prev = beforeNode
        beforeNode?.next = afterNode
        count -= 1
        return beingDeletedNode?.val
    }
}

let linkedList = DoubleLinkedList()

let insertedNode = linkedList.insert_between(beforeNode: linkedList.header, afterNode: linkedList.trailer, value: 3)
print(linkedList._len_())
linkedList.delete_node(beingDeletedNode: insertedNode)
print(linkedList._len_())
print("If True, the list is empty. If False, the list is not empty:  ", linkedList.is_empty())
