public class Node {
    let data: Int
    public var left: Node?
    public var right: Node?
    
    init(data: Int) {
        self.data = data
    }
    
    init?(data: Int, left: Node?, right: Node?) {
        self.data = data
        self.left = left
        self.left = right
    }
}

public class LinkedList {
    //var head: Node?
    fileprivate var head: Node?
    
    //  method to add a new node with the specific data value in the linked list
    //  insert the new node at the beginning of the linked list
    public func insert(_ value: Int) {
        let node = Node(data: value)
        node.next = head
        head = node
    }
    
    //  method to find if the linked list contains a node with specified value
    //  returns true if found, false otherwise
    public func search(value: Int) -> Bool {
        var node = head
        
        while node != nil {
            if node?.data == value {
                return true
            }
            node = node?.next
        }
        return false
    }
    
    //  method to return the max value in the linked list
    //  returns the data value and not the node
    public func find_max() -> Int? {
        if head == nil {
            return nil
        }
        
        var max = head?.data
        var node = head
        
        while node != nil {
            if node!.data > max! {
                max = node!.data
            }
            node = node?.next
        }
        
        return max
    }
    
    //  method to return the min value in the linked list
    //  returns the data value and not the node
    public func find_min() -> Int? {
        if head == nil {
            return nil
        }
        
        var min = head?.data
        var node = head
        
        while node != nil {
            if node!.data < min! {
                min = node!.data
            }
            node = node?.next
        }
        
        return min
    }
    
    //  method that returns the length of the singly linked list
    public func length() -> Int? {
        var node = head
        var length = 0
        
        if node == nil {
            return nil
        }
        
        while node != nil {
            length += 1
            node = node?.next
        }
        
        return length
    }
    
    //  method to return the value of the nth element from the beginning
    //  assume indexing starts at 0 while counting to n
    public func find_nth_from_beginning(_ index: Int) -> Int? {
        var node = head
        var counter = 0
        
        while node != nil {
            if index == counter {
                return node?.data
            }
            counter += 1
            node = node?.next
        }
        
        return nil
    }
    
    //  method to insert a new node with specific data value, assuming the linked
    //  list is sorted in ascending order
    public func insert_ascending(_ value: Int) {
        let newNode = Node(data: value)
        
        if head == nil {
            head = newNode
        } else if newNode.data <= head!.data {
            let temp = head
            head = newNode
            head!.next = temp
        } else {
            var node = head
            while node?.next != nil && node!.next!.data < newNode.data {
                node = node?.next
            }
            
            newNode.next = node?.next
            node?.next = newNode
        }
        
    }
    
    //  method to print all the values in the linked list
    public func visit() {
        var node = head
        
        while node != nil {
            if let data = node?.data {
                print(data)
            }
            node = node?.next
        }
    }
    
    //  method to delete the first node found with specified value
    public func delete(_ value: Int) {
        if head?.data == value {
            head = head?.next
        } else {
            var node = head
            
            while node?.next != nil && node?.next!.data != value {
                node = node?.next
            }
            
            if node!.next != nil {
                if node?.next!.next == nil {
                    node?.next = nil
                } else {
                    node?.next = node?.next?.next
                }
            }
        }
    }
    
    //  method to reverse the singly linked list
    //  note: the nodes should be moved and not just the values in the nodes
    public func reverse() {
        var node = head
        var prevNode: Node? = nil
        
        while node != nil {
            let tempNode = node?.next
            node?.next = prevNode
            prevNode = node
            node = tempNode
        }
        
        head = prevNode
    }
    
    //  returns the value at the middle element in the singly linked list
    public func  find_middle_value() -> Int? {
        var byOne = head
        var byTwo = head?.next
        
        while byTwo != nil {
            byOne = byOne?.next
            byTwo = byTwo?.next?.next
        }
        
        return byOne?.data
    }
    
    //  find the nth node from the end and return its value
    //  assume indexing starts at 0 while counting to n
    public func find_nth_from_end(_ index: Int) -> Int? {
        var node = head
        
        if index == 0 {
            while node?.next != nil {
                node = node?.next
            }
            return node?.data
        }
        
        var byIndex = head?.next
        
        for _ in 0..<index {
            byIndex = byIndex?.next
        }
        
        while byIndex != nil {
            node = node?.next
            byIndex = byIndex?.next
        }
        
        return node?.data
    }
    
    //  checks if the linked list has a cycle. A cycle exists if any node in the
    //  linked list links to a node already visited.
    //  returns true if a cycle is found, false otherwise.
    public func has_cycle() -> Bool {
        var i = head
        var j = head
        while j!.next != nil {
            i = i?.next
            j = j?.next?.next
            if i === j {
                return true
            }
        }
        return false
    }
    
    //  Creates a cycle in the linked list for testing purposes
    //  Assumes the linked list has at least one node
    public func create_cycle() {
        if head != nil {
            //  navigate to last node
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            
            current?.next = head //  make the last node link to first node
        }
    }
}

// implement using private data structure: array(keep track of index to keep constant time, limited number of indexes(if you know the max size ahead then ok), contiguous in memory) or linkedlist(easy insertion, deletion, extra space for .next), up to you
// this process of abstraction hides implementatinoi details, increases maintainabilitly & reduce complexity

public class Stack {
    private var dataStructure = LinkedList()
    
    public func top() -> Int? {
        return dataStructure.head?.data
//        return dataStructure.find_nth_from_beginning(0)
    }
    
    public func push(_ value: Int){
        dataStructure.insert(value)
    }
    
    public func pop() {
        dataStructure.head = dataStructure.head?.next
//        dataStructure.delete(dataStructure.find_nth_from_beginning(0)!)
    }
}

let test = Stack()
test.push(1)
test.push(2)
test.push(3)
test.push(4)
print("EXPECTING 4: \(test.top()!)")

test.pop()
print("EXPECTING 3: \(test.top()!)")

test.pop()
print("EXPECTING 2: \(test.top()!)")


public class Queue {
    private var dataStructure = LinkedList()
    //USING AN ARRAY: CIRCULAR BUFFER IN A SEPERATE FILE
    
    public func enqueue(_ value: Int?) {
        guard let value = value else {
            return
        }
        dataStructure.find_nth_from_end(0) = Node(data: value)
    }
    public func dequeue() {
        
    }
    
}




