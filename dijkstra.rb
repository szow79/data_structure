# shortest distance for path

# use AL (ajacent list)

#

class Vertice
  def initialize(name)
    @name = name
    @neighbors = []
  end

  def add(vertice)
    @neighbors.push(vertice)
  end
end


