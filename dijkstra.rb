# shortest distance for path

# use AL (ajacent list)

#

class Vertice
  def initialize(name)
    @name = name
    @neighbors = []
  end

  def add(vertice, distance)
    @neighbors.push({vertice: vertice, distance: distance})
  end
end


