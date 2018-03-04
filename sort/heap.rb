def sift_down(arr, i, last_unsorted_index=nil)
  last_unsorted_index ||= arr.length - 1
  min_index = i
  left = 2 * i + 1
  right = 2 * i + 2
  if left < last_unsorted_index && arr[left] < arr[min_index]
    min_index = left
  end
  if right < last_unsorted_index && arr[right] < arr[min_index]
    min_index = right
  end
  if i != min_index
    arr[i], arr[min_index] = arr[min_index], arr[i]
    sift_down(arr, min_index, last_unsorted_index)
  end
end

def heapify(arr)
  i = arr.length / 2
  while i >= 0
    sift_down(arr, i)
    i -= 1
  end
  arr
end

def heap_sort(arr)
  heapify(arr)
  i = arr.length - 1
  while i > 0
    arr[0], arr[i] = arr[i], arr[0]
    sift_down(arr, 0, i)
    i -= 1
  end
  arr
end

heap_sort([9,7,3,5,8,2,6])
