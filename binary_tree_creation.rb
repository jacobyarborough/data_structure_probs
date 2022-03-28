# binary trees are made of nodes
# every node can have two other nodes

# TreeNode represents a node on a tree
# a node needs a value and pointers to up to two other nodes
class TreeNode 
  attr_accessor :value,
                :left,
                :right 

  def initialize(value)
    @value = value
  end 

  # assuming this is breadth first search
  def find_node(node, value)
    # return false if we do not have a node
    return false unless node
    # return false if the node has the value we are looking for
    return true if node.value == value

    find_node(node.left, value) || find_node(node.right, value)
  end 

  # non recursive node, but uses stack
  def find_node(node, value)
    stack = [node]
    until stack.empty?
      node = stack.pop

      return true if node.value == value

      stack << node.left if node.left
      stack << node.right if node.right
    end 

    false 
  end 
end 

tree = TreeNode.new(5)
tree.left = TreeNode.new(3)
tree.right = TreeNode.new(8)

tree.left.left = TreeNode.new(2)
tree.right.right = TreeNode.new(6)

# depth first searches
# preorder: root, left subtree, right subtree,
# inorder: left subtree, root, right subtree
# postorder: left subtree, right subtree, root
