class Guest
  attr_accessor :left, :right
  attr_reader :name

  def initialize(name)
    @name = name
    @left = nil
    @right = nil
  end
end

class Table

  def initialize
    @first_guest = nil
  end

  def add(name)
    guest = Guest.new(name)
    if @first_guest
      current_guest = @first_guest
      while current_guest.right && current_guest.right != @first_guest
        current_guest = current_guest.right
      end
      current_guest.right = guest
      guest.left = current_guest
      guest.right = @first_guest
      @first_guest.left = guest
    else
      @first_guest = guest
    end
    true
  end

  def get(name)
    current_guest = @first_guest
    if current_guest
      while current_guest.name == name || current_guest.right != @first_guest
        if current_guest.name == name
          return [current_guest.left.name, current_guest.right.name]
        end
        current_guest = current_guest.right
      end
    else
      false
    end
  end

  def delete(name)
    current_guest = @first_guest
    if current_guest
      while current_guest.name == name || current_guest.right != @first_guest
        if current_guest.name == name
          if @first_guest == current_guest
            @first_guest = current_guest.right
          end
          current_guest.left.right = current_guest.right
          current_guest.right.left = current_guest.left
          return true
        end
      end
    end
    false
  end
end

a = Guest.new("Alan")
b = Guest.new("Bob")
c = Guest.new("Cat")
d = Guest.new("Duke")

t = Table.new

t.add(a.name)
t.add(b.name)
t.add(c.name)
t.add(d.name)


p t.get(a.name)
p t.get(b.name)
p t.get(c.name)

t.delete("Alan")

p t.get(b.name)
p t.get(c.name)



