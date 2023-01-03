# LinkedList class, which will represent the full list
class LinkedList
  def initilize(head = nil, tail = nil)
    # A head node is the first node in the list
    # A tail node is the last node in the list
    @head = head
    @tail = tail
  end

  # Add a new node containing value to the end of the list
  def append(value)
   new_node = Node.new(value)

   if @head.nil?
    @head = new_node
    @tail = new_node
   else
    @tail.next_node = new_node
    @tail = new_node
   end
   self.to_s
  end

  # Add a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value)

    if head.nil?
      @head = new_node
      @tail = new_node
     else
      new_node.next_node = @head
      @head = new_node
     end
     self.to_s
  end

  # Return the total number of nodes in the list
  def size
    current = @head
    count = 0
    while(current)
      count += 1
      current = current.next_node
    end
    count
  end

  # Return the first node in the list
  def head
    @head
  end

  # Return the last node in the list
  def tail
    @tail
  end

  # Return the node at the given index
  def at(index)
    current = @head
    current_index = 0
    until(current_index == index)
      current_index += 1
      current = current.next_node
    end
    current
  end

  # Remove the last element from the list
  def pop
    second_last_element = self.at(self.size - 2)
    second_last_element.next_node = nil
    @tail = second_last_element
    self.to_s
  end

  # Return true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    current = @head
    while(current)
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  # Return the index of the node containing value, or nil if not found
  def find(value)
    current = @head
    current_index = 0
    while(current)
      return current_index if current.value == value
      current = current.next_node
      current_index += 1
    end
    nil
  end

  # Represent your LinkedList objects as strings
  # so you can print them out and preview them in the console
  # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    current = @head
    while(current)
      print "( #{ current.value } ) -> "
      current = current.next_node
    end
    print 'nil'
    puts ''
  end

  # Extra Credit

  #insert_at(value, index) that inserts a new node with the provided value at the given index
  def insert_at(value, index)
    return unless index <= self.size

    new_node = Node.new(value, self.at(index))
    @head = new_node if index == 0
    self.at(index - 1).next_node = new_node if index > 0
    self.to_s
  end

  #remove_at(index) that removes the node at the given index
  def remove_at(index)
    return unless index <= self.size

    element = self.at(index)
    @head = self.at(index + 1) if index == 0
    self.at(index - 1).next_node = self.at(index + 1) if index > 0
    element
  end
end

# Node class, containing a #value method and a link to the #next_node, set both as nil by default
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

ll = LinkedList.new
ll.append(100)
ll.append(200)
ll.prepend(50)
puts "Size: #{ll.size}"
puts "Head: #{ll.head.value}"
puts "Tail: #{ll.tail.value}"
puts "At index 1: #{ll.at(1).value}"
ll.pop
puts "Contains 100?: #{ll.contains?(100)}; Contains 500?: #{ll.contains?(500)}"
puts "Index of 100: #{ll.find(100)}; Index of 500: #{ll.find(500)}"
ll.insert_at(70, 1)
puts ll.remove_at(0).value
ll.to_s
p ll
