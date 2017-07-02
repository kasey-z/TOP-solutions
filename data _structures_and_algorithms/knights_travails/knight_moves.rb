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
    neighbors_arr = [[x + 2, y - 1], [x + 2, y + 1], [x - 2, y - 1], [x - 2, y + 1],
                     [x + 1, y - 2], [x + 1, y + 2], [x - 1, y - 2], [x - 1, y + 2]]
    neighbors_arr = neighbors_arr.select { |arr| (0..7).include?(a[0]) && include?(a[1]) }
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
