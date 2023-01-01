class LinkedList
  def append(value)
    Node.new(value)
  end
end

class Node
  def initilize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end