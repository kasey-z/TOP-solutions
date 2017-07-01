# objects of this class hold a count that it stores and also links to its parent and children.
class Node
  attr_accessor :key, :count, :left, :right

  def initialize(key)
    @key, @count = key, 1
    @left = @right = nil
  end
end

# no repeat key-node, if there are same key element, the node will count += 1
class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert_data(data, root)
    return root = Node.new(data) if root.nil?

    case data <=> root.key
    when -1 then root.left = insert_data(data, root.left)
    when 1 then root.right = insert_data(data, root.right)
    when 0 then root.count += 1
    end

    root
  end
# takes an array of data, turns it into a binary tree
  def build_tree(arr)
    @root = Node.new(arr.shift)
    arr.each { |data| insert_data(data, @root) }
  end

  def breadth_first_search(data)
    queue = [@root]
    list = {}
    found_key = nil
    return nil if @root.nil?

    while !queue.empty?
      node = queue.shift
      list[node.key] = node.count
      if data != node.key
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
      else
        found_key = list
        break
      end
    end
    found_key
  end

#In-order depth_first_search left-data-right
  def depth_first_search(data)
    return nil if @root.nil?
    stack = [@root]
    answer = nil
    list = {}
    current = @root
    until stack.empty? && current.nil?
#left
      until current.nil?
        stack << current
        current = current.left
      end
#print/data
      current = stack.pop
      list[current.key] = current.count
      if current.key == data
        answer = list
        break
# right
      else
        current = current.right
      end
    end
    answer
  end

#In-order depth_first_search left-data-right
  def dfs_rec(data, node = @root, list= {})
    return nil if node.nil?
#left
    left = dfs_rec(data, node.left, list)
#print/data
    if left.nil?
      list[node.key] = node.count
      if node.key == data
        return list
#right
      else
        right = dfs_rec(data, node.right, list)
      end
    else
      return left
    end
  end

end
