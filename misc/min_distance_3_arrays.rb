class Node
  attr_accessor :value, :index
  def initialize(value, index)
    @value = value
    @index = index
  end
end

def remove_min_node(nodes)
  min_value = nil
  min_index = nil
  max_value = 0
  temp_min_index = nil
  nodes.each_with_index do |node, index|
    if min_value.nil? || node.value < min_value
      min_value = node.value
      min_index = node.index
      temp_min_index = index
    end
    if max_value < node.value
      max_value = node.value
    end
  end
  nodes.delete_at(temp_min_index)
  return nodes, min_index, max_value - min_value
end

def min(matrix_dup)
  matrix = matrix_dup
  min_value = nil
  min_nodes = []
  nodes = []
  matrix.each_with_index do |row, index|
    nodes << Node.new(row.shift, index)
  end
  loop do
    nodes, min_index, diff = remove_min_node(nodes)
    p nodes
    if min_value.nil? || min_value > diff
      min_value = diff
      min_nodes = nodes
    end
    new_value = matrix[min_index].shift
    break if new_value.nil?
    nodes << Node.new(new_value, min_index)
    p nodes
    p min_value
  end
  return min_value, min_nodes
end


matrix = [[0, 14, 28, 30],
[4, 9, 25, 50],
[8, 10, 19, 21]]