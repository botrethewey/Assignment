public class BinaryNode {
    let data: Int
    public var left: BinaryNode?
    public var right: BinaryNode?
    
    init(data: Int) {
        self.data = data
    }
    
    init?(data: Int, left: BinaryNode?, right: BinaryNode?) {
        self.data = data
        self.left = left
        self.left = right
    }
}


public class BinarySearchTree {
    private var root: BinaryNode?
    
    init(root: BinaryNode) {
        self.root = root
    }
    
    public func findValue(value: Int, root: BinaryNode?) -> Bool {
        if root == nil {
            return false
        }
        
        if value == root!.data {
            return true
        }
        
        if value < root!.data {
            return findValue(value: value, root: root?.left)
        } else {
            return findValue(value: value, root: root?.right)
        }
    }
    
    private func insertHelper(_ current: BinaryNode?, _ value: Int) {
        if let current = current {
            // insert new node to the left
            if value <= current.data {
                // current's left node exists, go deeper
                if current.left != nil {
                    return insertHelper(current.left, value)
                } else {
                // current's left node is nill, insert it here
                    current.left = BinaryNode(data: value)
                }
            // insert new node to the right
            } else {
                // current's right node exists, go deeper
                if current.right != nil {
                    return insertHelper(current.right, value)
                } else {
                // current's left node is nill, insert it here
                    current.right = BinaryNode(data: value)
                }
            }
        }
    }
    

}
