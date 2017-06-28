#LinkedList class, which will represent the full linked list.
class LinkedList
  def initialize
    @head = nil
    @tail = nil #is this nessecary?
  end

#adds a new node to the end of the list
  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

# adds a new node to the start of the list
  def prepend(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

#returns the total number of nodes in the list
  def size
    return 0 if @head.nil?
    tmp = @head
    count = 0
    until tmp.nil?
      tmp = tmp.next_node
      count += 1
    end
    count
  end

#returns the first node in the list
  def head
    return nil if @head.nil?
    @head.value
  end

#returns the node at the given index
  def tail
    return nil if @head.nil?
    @tail.value
  end

#returns the node at the given index
  def at(index)
    return nil if @head.nil? || index > self.size - 1
    tmp = @head
    index.times { tmp = tmp.next_node }
    tmp.value
  end

# removes the last element from the list
  def pop
    count = self.size
    return nil if count == 0
    if count == 1
      answer = @head.value
      @head == nil
      @tail == nil
      answer
    else
      cur = @head
      prev = nil
      (count - 1).times do
        prev = cur
        cur = cur.next_node
      end
      answer = cur.value
      prev.next_node = nil
      @tail = prev
      answer
    end
  end

#returns true if the passed in value is in the list and otherwise returns false.
  def contains?(data)
    return false if @head.nil?
    tmp = @head
    answer = false
    until tmp.nil?
      answer = true if tmp.value == data
      tmp = tmp.next_node
    end
    answer
  end

#returns the index of the node containing data, or nil if not found.
  def find(data)
    return nil if @head.nil?
    i = 0
    answer = nil
    tmp = @head
    until tmp.nil?
      answer = i if tmp.value == data
      tmp = tmp.next_node
      i += 1
    end
    answer
  end

#represent your LinkedList objects as strings, so you can print them out and preview them in the console.
  def to_s
    return nil if @head.nil?
    string = ''
    tmp = @head
    until tmp.nil?
      string += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    string += 'nil'
    string
  end

#inserts the node at the given index
  def insert_at(index, data)
    return nil if @head.nil? || index > self.size - 1
    if index == 0
      self.prepend(data)
    elsif index == self.size - 1
      self.append(data)
    else
      node = Node.new(data)
      cur = @head
      prev = nil
      index.times do
        prev = cur
        cur = cur.next_node
      end
      node.next_node = cur
      prev.next_node = node
    end
  end

#epresent your LinkedList objects as strings, so you can print them out and preview them in the console.
  def remove_at(index)
    return nil if @head.nil? || index > self.size - 1
    if index == 0
      @head = @head.next_node
    elsif index == self.size - 1
      self.pop(node)
    else
      cur = @head
      prev = nil
      index.times do
        prev = cur
        cur = cur.next_node
      end
      prev.next_node = cur.next_node
    end
  end

end

#Node class, containing a #value method and a link to the #next_node, set both as nil by default.
class Node
  attr_accessor :value, :next_node

  def initialize(data=nil)
    @value = data
    @next_node = nil
  end
end
