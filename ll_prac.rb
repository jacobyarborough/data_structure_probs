# implement a linked list class 
require 'pry'

class LinkedList 
  attr_accessor :head

  def initialize
    @head = nil 
  end 

  def append(value)
    if @head == nil 
      @head = Node.new(value)
    else 
      find_tail.next = Node.new(value)
    end 
  end

  def find_tail 
    node = @head

    return node if node.next == nil

    while node = node.next do 
      return node if node.next == nil
    end 
  end 

  def reverse
    node = @head 
    prev = nil

    while node != nil do
      future = node.next
      node.next = prev
      prev = node
      node = future
    end 
    @head = prev
  end 

  def self.combine_lists(list1, list2) 
    return list2 if list1.head == nil 
    return list1 if list2.head == nil
  end 
end 

class Node
  attr_reader :data
  attr_accessor :next
  
  def initialize(value)
    @data = value
    @next = nil 
  end 
end 


new_list = LinkedList.new
new_list.append(2)
new_list.append(3)
new_list.append(4)
puts "Before reversing the head is #{new_list.head.data} and the tail is #{new_list.find_tail.data}"
new_list.reverse
puts "After reversing the head is #{new_list.head.data} and the tail is #{new_list.find_tail.data}"

list1 = LinkedList.new
list1.append(1)
list1.append(3)
list1.append(5)
list1.append(7)
list1.append(9)
list2 = LinkedList.new
result_list = LinkedList.combine_lists(list1, list2)
puts result_list.head.data 
puts result_list.find_tail.data
