def bubble_sort(arr)
  j = arr.length - 1
  while j > 0
    i = 0
    while i < j
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
      i += 1
    end
    j -= 1
  end
  arr
end
