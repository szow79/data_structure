def spiral(matrix)
  x = 0
  y = 0
  action = 0
  array = Array.new(matrix.length) { Array.new }
  magic_number = 1
  j = 0
  times = array.length - j - 1
  matrix.each do |row|
    row.each do |col|
      array[x][y] = col
      x, y = move(action, x, y)
      times -= 1
      if times == 0
        action += 1
        magic_number += 1
        if magic_number % 2 == 0
          j += 1
        end
        times = array.length - j
      end
    end
  end
  array
end


def move(action, x, y)
  if action % 4 == 0
    y += 1
  elsif action % 4 == 1
    x += 1
  elsif action % 4 == 2
    y -= 1
  else
    x -= 1
  end
  return x, y
end