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
  end

  # Remove the last element from the list
  def pop
  end

  # Return true if the passed in value is in the list and otherwise returns false
  def contains?(value)
  end

  # Return the index of the node containing value, or nil if not found
  def find(value)
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
ll.to_s
puts ll.size