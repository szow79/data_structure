class Node
  attr_reader :val
  attr_accessor :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def add(val)
    if @root.nil?
      @root = Node.new(val)
    else
      current_node = @root

      loop do
        if current_node.val == val
          return "Node already exists!"
        elsif current_node.val > val
          if current_node.left.nil?
              current_node.left = Node.new(val)
            break
          end
          current_node = current_node.left
        else
          if current_node.right.nil?
              current_node.right = Node.new(val)
            break
          end
          current_node = current_node.right
        end
      end
    end
  end

  def delete(val)
    @root = nil if @root && @root.val == val
    current_node = @root
    loop do
      if current_node.val > val
        if current_node.left.val == val
          current_node.left = nil
          break
        elsif
          current_node.left.nil?
          break
        end
        current_node = current_node.left
      else
        if current_node.right.val == val
          current_node.right = nil
          break
        elsif
          current_node.right.nil?
          break
        end
        current_node = current_node.right
      end
    end
  end

  def find(val)
    return unless @root
    current_node = @root
    while current_node
      if current_node.val == val
        return current_node
      elsif current_node.val > val
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
    current_node
  end

  def exist?(val)
    !find(val).nil?
  end
end
