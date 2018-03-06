require "set"

def shortest_path(matrix, starting, ending)
  paths = [{path: Set.new([starting]), coor: starting}]
  curr_i = 0
  while curr_i < paths.length
    curr = paths[curr_i]
    return curr[:path] if curr[:coor] == ending
    n = neighbors(matrix, curr)
    paths += n
    curr_i += 1
  end
  -1
end

def neighbors(matrix, path)
  pa = []
  x, y = path[:coor][0], path[:coor][1]
  if matrix[x+1] && matrix[x+1][y] == "T" && !path[:path].include?([x+1, y])
    pa << {path: path[:path] + [[x+1, y]], coor: [x+1, y]}
  end
  if x - 1 >= 0 && matrix[x-1][y] == "T" && !path[:path].include?([x-1, y])
    pa << {path: path[:path] + [[x-1, y]], coor: [x-1, y]}
  end
  if matrix[x][y+1] == "T" && !path[:path].include?([x, y+1])
    pa << {path: path[:path] + [[x, y+1]], coor: [x, y+1]}
  end
  if y - 1 >= 0 && matrix[x][y-1] == "T" && !path[:path].include?([x, y-1])
    pa << {path: path[:path] + [[x, y-1]], coor: [x, y-1]}
  end
  pa
end

matrix = [
  ["T", "T", "F", "F"],
  ["T", "T", "F", "F"],
  ["T", "T", "F", "F"],
  ["F", "T", "T", "F"],
]

starting = [0, 0]
ending = [3, 2]

p shortest_path(matrix, starting, ending)
# p neighbors(matrix, {:path=>"", :coor=>[0, 0]})
# p neighbors(matrix, {:path=>"R", :coor=>[1, 0]})
# p neighbors(matrix, {:path=>"R", :coor=>[0, 1]})
