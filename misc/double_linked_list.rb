class Guest
  attr_accessor :name, :left, :right
  def initialize(name)
    @name = name
    @left = nil
    @right = nil
  end
end

class List
  attr_accessor :list
  def initialize
    @list = []
  end

  def show_guest_list
    @list.map(&:name)
  end

  def add(guest)
    if @list.first.nil?
      @list.push(guest)
      guest.left = guest
      guest.right = guest
    else
      first_guest = @list.first
      last_guest = @list.last
      @list.push(guest)
      guest.left = last_guest
      guest.right = first_guest
      last_guest.right = guest
      first_guest.left = guest
    end
    "Successfully added guest #{guest.name}"
  end

  def get(name)
    @list.each do |guest|
      if guest.name == name
        return [guest.left.name, guest.right.name]
      end
    end
    "The guest is not on the list!"
  end

  def remove(name)
    @list.each_with_index do |guest, index|
      if guest.name == name
        left_guest = guest.left
        right_guest = guest.right
        left_guest.right = right_guest
        right_guest.left = left_guest
        @list.delete_at(index)
        return "Successfully removed guest #{guest.name}"
      end
    end
    "The guest is not on the list!"
  end
end



["grace", ken, alan, tom, peter, grace]


t = Guest.new("tom")
g = Guest.new("grace")
p = Guest.new("peter")
a = Guest.new("alan")
k = Guest.new("ken")
l = List.new
l.add(k)
l.add(a)
l.add(t)
l.add(p)
l.add(g)
l.remove("alan")
a = Guest.new("alan")
l.add(a)
