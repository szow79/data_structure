class Node
  attr_reader :key
  attr_accessor :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end

  def insert(key)
    if self.key > key
      if self.left
        self.left.insert(key)
      else
        self.left = Node.new(key)
      end
    else
      if self.right
        self.right.insert(key)
      else
        self.right = Node.new(key)
      end
    end
  end

  def lookup(key)
    return false unless self
    return self if self.key == key
    if self.key > key
      self.left.loopup(key)
    else
      self.right.loopup(key)
    end
  end

  def delete(key)

  end

  def self_balance
    all_keys = all_nodes.map(&:key).sort
    mid_index = all_keys.length / 2
    self.key = all_keys.slice!(mid_index)
    self.left = nil
    self.right = nil
    all_keys.each do |key|
      node.insert(key)
    end
    node
  end

  def all_nodes
    return unless self
    all = [self]
    all += self.left.all_nodes
    all += self.right.all_nodes
  end

end

