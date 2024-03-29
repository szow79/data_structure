class Node
  attr_reader :val
  attr_accessor :index

  def initialize(val)
    @val = val
    @index = nil
  end

  def left_child_index
    index + 1
  end

  def right_child_index
    index + 2
  end

  def parent_index
    (index + 1) / 2 - 1
  end

end

class MinHeap
  attr_reader :arr

  def initialize
    @arr = []
  end

  def peek

  end

  def push(node)
    arr.push(node)
    node.index = arr.length - 1
    loop do
      parent = parent(node)
      break unless node.index > 0 && node.parent_index >= 0  && node.val < parent.val
      parent.index, node.index = node.index, parent.index
      arr[node.index], arr[parent.index] = arr[parent.index], arr[node.index]
    end
  end

  def pop
     current_node = min

     min_child = min_child(current_node)
     while min_child && current_node

       current_node_index = current_node.index
       arr[current_node_index] = min_child
       current_node = min_child(min_child)
       min_child.index = current_node_index

     end
     arr.pop
   end

  def merge(heap)

  end

  def left_child(node)
    arr[node.left_child_index]
  end

  def right_child(node)
    arr[node.right_child_index]
  end

  def min_child(node)
    children = [left_child(node), right_child(node)].compact
    if children.length > 1
      children[0].val > children[1].val ? children[1] : children[0]
    else
      children.first
    end
  end

  def parent(node)
    arr[node.parent_index]
  end

  def min
    arr.first
  end

end

b = Node.new(2)
i = Node.new(20)
a = Node.new(1)
d = Node.new(4)
f = Node.new(13)
e = Node.new(7)
g = Node.new(15)
c = Node.new(3)
h = Node.new(10)

heap = MinHeap.new
[b, i, a, d, f, e, g, c, h].each do |node|
  heap.push(node)
end

p heap.arr.map(&:val) == [1, 3, 2, 4, 13, 7, 15, 20, 10]
3.times do
  heap.pop
  p heap.arr.map(&:val)
end

# p heap.arr.map(&:index)


# children = 2i + 1, 2i + 2
# parent = (i + 1) / 2 - 1
