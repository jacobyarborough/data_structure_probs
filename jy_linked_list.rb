require 'pry'

class Node 
  attr_accessor :next 
  attr_reader :data

  def initialize(data)
    @data = data 
    @next = nil 
  end 

  def show
    "Node has a value of #{@data}"
  end 
end 

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end 

  def find(value)
    node = @head

    return false if !node.next
    return node if node.data == value
    return node if node.data == value while (node = node.next)
  end 

  def find_tail
    node = @head
    
    return node if !node.next 
    return node if !node.next while (node = node.next)
  end 

  def find_before(target)
    node = @head

    return false if !node.next
    return node  if node.next.data == target
    return node if node.next.data == target while (node = node.next)
  end 

  def append(data)
    if @head 
      find_tail.next = Node.new(data)
    else 
      @head = Node.new(data)
    end 
  end 

  def append_before(target, data)
    if @head 
      if @head.data == target
        node = @head 
        @head = Node.new(data)
        @head.next = node 
      else 
        node = find_before(target)
        after_node = node.next 
        node.next = Node.new(data)
        node.next.next = after_node
      end 
    else 
      @head = Node.new(data)
    end 
  end 

  def append_after(target, data)
    node = find(target)
    return unless node 
    old_next = node.next 
    node.next = Node.new(data)
    node.next.next = old_next
  end 

  def delete(target)
    if @head == target 
      @head = @head.next 
      return
    end 

    node = find_before(target)
    node.next = node.next.next
  end 

  def print 
    node = @head
    puts node.show

    while (node = node.next)
      puts node.show
    end
  end

  def new_head(data)
    if @head 
      old_head = @head
      @head = Node.new(data)
      @head.next = old_head
    else 
      @head = Node.new(data)
    end 
  end 
  
  def pos_append(pos, data)
    if pos == 1 
      old_head = @head 
      @head = Node.new(data)
      @head.next = old_head 
    else 
      pos = pos -2
      node = @head 
      target = node
      pos.times do |i|
        target = node.next
      end 

      old_next = target.next 
      target.next = Node.new(data)
      target.next.next = old_next
    end 
  end 

  def reverse 
    node = @head 
    prev = nil
    while node != nil
      future = node.next 
      node.next = prev
      prev = node
      node = future
    end 
    @head = prev
  end 
end 

#sorts in ascending order for an int linked list; returns a new linked list
def sorted
  sorted = nil 
  node = @head

  while (current != nil)
    future = node.next 
    if (sorted == null || sorted.val >= node.data)
      node.next = sorted 
      sorted = node
    else 
      current = sorted 
      while (current.next != null && current.next.val < node.val)
        current = current.next 
      end 
      node.next = current.next 
      current.next = node
    end 
    node = future 
  end 

  @head = sorted
end 

binding.pry