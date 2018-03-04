def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_index = rand(0...arr.length)
  pivot = arr.slice!(pivot_index)
  left = []
  right = []
  arr.partition do |n|
    n > pivot ? right.push(n) : left.push(n)
  end
  [quick_sort(left), pivot, quick_sort(right)].flatten
end

quick_sort([9,7,3,5,8,2,6])
