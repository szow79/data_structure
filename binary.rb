def binary(arr, target)
  mid = arr.length / 2
  return mid if arr[mid] == target
  return if arr.length <= 1
  if arr[mid] > target
    binary(arr[0...mid], target)
  else
    r = binary(arr[mid..-1], target)
    mid + r if r
  end
end

p binary([1,2,3,4], 4)
p binary([1,2,3,4], 3)
p binary([1,2,3,4], 2)
p binary([1,2,3,4], 0)
p binary([1,2,3,4], 5)
