class Node 
  attr_accessor :data, :next

  def initialize(value)
    @data = value
    @next = nil 
  end 
end 

# defining the LinkedList class which will be comprised of nodes from the Node class
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil 
  end 

  # the find_tail method will find the last node in the list and return that node
  def find_tail
    return false if !@head

    node = @head 

    return node if node.next == nil

    while node.next != nil
      node = node.next
    end 

    return node
  end 

   # appends a new node to the end of the list by utilizing the find_tail method
  def append(value)
    if !@head
      @head = Node.new(value)
    else
      find_tail.next = Node.new(value)
    end 
  end 

  # inserts a new node at the beggining of the list and assigns it to the variable @head
  def insert(value)
    if !@head
      @head = Node.new(value)
    else 
      prev_head = @head 
      @head = Node.new(value)
      @head.next = prev_head
    end
  end 

  # method that allows a user to append many values to the end of the linked list at once
  def append_many(values)
    values.each do |value|
      append(value)
    end 
  end 

  # inserts a new node at a specific position in the list
  def insert_pos(pos, value)
    if pos == 1
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    else
      i = 0
      node = @head 

      while i < pos - 2
        node = node.next
        i += 1
      end 

      if node.next != nil
        new_node = Node.new(value)
        future_node = node.next
        new_node.next = future_node
        node.next = new_node
      else
        node.next = Node.new(value)
      end 
    end 
  end 

  # reverses the list utilizing recursion
  def reverse_recursive(node = @head)
    if node.next == nil
      @head = node 
      return
    end 
    
    reverse_recursive(node.next)

    a = node.next 
    a.next = node 
    node.next = nil
  end 

  # prints the data component of each node from the entire list
  def print
    puts false if !@head
    
    node = @head 

    puts node.data if node.next == nil 

    while node
      puts node.data 
      node = node.next
    end 
  end 

  # merges two lists in ascending order and returns the head node of the new sorted list
  def self.merge(node1, node2)

    return node1 if !node2
    return node2 if !node1

    new_head = nil 
    sorted_list = nil 

    if (node1.data && node2.data)
      if node1.data <= node2.data 
        sorted_list = node1
        node1 = sorted_list.next
      else 
        sorted_list = node2 
        node2 = sorted_list.next
      end 
    end 

    new_head = sorted_list

    while (node1 != nil && node2 != nil)
      if node1.data <= node2.data 
        sorted_list.next = node1 
        sorted_list = node1
        node1 = sorted_list.next
      else 
        sorted_list.next = node2
        sorted_list = node2
        node2 = sorted_list.next
      end 
    end 

    if node1 == nil
      sorted_list = node2
    elsif node2 == nil 
      sorted_list = node1
    end 

    return new_head
  end 

  # merges two lists by utlizing recursion
  def self.merge_recursive(node1, node2)
    return node1 if node2 == nil
    return node2 if node1 == nil

    if node1.data < node2.data
      node1.next = merge_recursive(node1.next, node2)
      return node1
    else 
      node2.next = merge_recursive(node1, node2.next)
      return node2
    end
  end 
end 
