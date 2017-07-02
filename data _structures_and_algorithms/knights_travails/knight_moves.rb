class Vertex
  attr_accessor :key, :neighbors

  def initialize(key, neighbors)
    @key = key
    @neighbors = neighbors
  end
end

class Graphs
  attr_accessor :vertices
#use hash, or array to store the vertices. if use array. need to make a find_the_vertex_by _key method
  def initialize
    @vertices = {}
    create_graph
  end

  private

#every coordinate 's all possible positons in one move as the vertex's neighbors
  def create_graph
    all_coordinates = get_all_coordinates
    all_coordinates.each do |key|
      neighbors = get_neighbor_arr(key)
      add_vertex(key,neighbors)
    end
    @vertices
  end
  #take an array as an coordinate like [1,2], return an array for one move
  def get_neighbor_arr(arr)
    x = arr[0]
    y = arr[1]
    x1s = new_coordinate(x,1)
    x2s = new_coordinate(x,2)
    y1s = new_coordinate(y,1)
    y2s = new_coordinate(y,2)
    children_arr = (x_y_array(x1s, y2s) + x_y_array(x2s, y1s)).uniq
  end

  def new_coordinate(m,n)
    arr = [m+n,m-n].select{ |a| (0..7).include?(a) }
  end

  def x_y_array(a, b)
    children = []
    a.each { |x| b.each { |y| children << [x,y] } }
    children
  end

  def add_vertex(key,neighbors)
    @vertices[key] = Vertex.new(key, neighbors)
  end

# take in two coordinates, give an array of listed vertexs as result.
  def breadth_first_search(start, target)
    queue = [ @vertices[start] ]
    visited = []
    found_key = false

    until queue.empty?
      vertex = queue.shift
      if vertex.key == target
        found_key = true
        break
      else
        visited << vertex
        vertex.neighbors.each { |key| queue << @vertices[key] unless visited.include?(@vertices[key])}
      end
    end

    found_key ? visited : nil
  end

  public

  def get_all_coordinates
    all_coordinates = []
    0.upto(7) { |a| 0.upto(7) { |b| all_coordinates << [a,b] } }
    all_coordinates
  end

# from the BFS's result, iterately find out all the parent vertexs
  def find_moves(start, target)
    visited = breadth_first_search(start, target)
    moves = []
    find_coordinate = target

    visited.reverse.each do |vertex|
      vertex.neighbors.each do |coordinate|
        if coordinate == find_coordinate
          moves << vertex.key
          find_coordinate = vertex.key
        end
      end
    end

    moves.reverse << target
  end

end

# This class store moves and the player's input. Not necessary at this moment.
class Knight
  attr_accessor :start_square, :target_square, :moves

  def initialize
    @start_square = nil
    @target_square = nil
    @moves = []
  end
end
