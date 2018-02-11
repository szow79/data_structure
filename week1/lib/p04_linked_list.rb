class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev_link = self.prev
    next_link = self.next
    prev_link.next = next_link
    next_link.prev = prev_link
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |link|
      return link.val if link.key == key
    end
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def append(key, val)
    link = Link.new(key, val)
    last_link = @tail.prev
    last_link.next = link
    link.prev = last_link
    link.next = @tail
    @tail.prev = link
  end

  def update(key, val)
    each do |link|
      link.val = val if link.key == key
    end
  end

  def remove(key)
    each do |link|
      link.remove if link.key == key
    end
  end

  def each
    current = @head
    loop do
      current = current.next
      break if current == @tail
      yield current
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
