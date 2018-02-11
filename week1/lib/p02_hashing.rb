class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    h = 0
    self.each_with_index do |c, i|
      h =+ c.to_s.ord * i
    end
    h
  end
end

class String
  def hash
    h = 0
    self.chars.each_with_index do |c, i|
      h =+ c.ord * i
    end
    h
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.flatten.inject(0) do |sum, arr|
      sum + arr.hash
    end
  end
end
