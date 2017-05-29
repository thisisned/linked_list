class LinkedList # List for keeping all the nodes in
  attr_accessor :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?   # i.e. If list is empty
      @head = node
    else
      @tail.next = node # Change current tail's pointer to new node
    end
    @tail = node # Make new node the tail
    @size += 1
    value
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @tail = node
    else
      node.next = @head # Make new node point to current head
    end
    @head = node # Make new node the head
    @size += 1
    value
  end

  def size
    @size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return "No node at index" if index >= @size || index < 0
    current_node = @head
    index.times do # Move through list however many times
      current_node = current_node.next
    end
    current_node
  end

  def pop
  	pop_data = @tail.value # So method returns popped data
    current_node = @head
    (@size - 2).times do # Move to penultimate item
      current_node = current_node.next
    end
    @tail = current_node # Make this the new tail and point it to nil
    @tail.next = nil
    @size -= 1
    pop_data
  end

  def contains?(value)
    current_node = @head
    (@size - 1).times do
      current_node = current_node.next
      return true if current_node.value == value
    end
    return false
  end

  def find(value)
    current_node = @head
    (size - 1).times do |i|
      return i if current_node.value == value
      current_node = current_node.next
    end
    return nil
  end

  def to_s
    current_node = @head
    string = []
    size.times do
      string << "( " + current_node.value.to_s + " )"
      current_node = current_node.next
    end
    string << "nil"
    string.join(" -> ")
  end

  def insert_at(data, index)
    if index > size
      puts "Index too large, data added to end of list"
      index = size
    elsif index == 0
      prepend(data)
      return
    end
    current_node = at(index-1)
    node = Node.new(data)
    next_node = current_node.next
    current_node.next = node
    node.next = next_node
    @size += 1
    data
  end

  def remove_at(index)
    if index == 0
      @head = @head.next
      @size -= 1
      return
    elsif index >= size
      puts "No node at index"
      return
    end
    delete_node = at(index)
    next_node = delete_node.next
    previous_node = at(index-1)
    previous_node.next = next_node
    delete_node.next = nil
    @size -= 1
    delete_node.value
  end
end

class Node # Nodes for being kept all in the list
  attr_accessor :value, :next
  
  def initialize (value = nil)
    @value = value
    @next = nil
  end
end